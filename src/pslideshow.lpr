program pSlideShow;
{$mode delphi}{$h+}

uses
 {$ifdef TARGET_RPI_INCLUDING_RPI0}  BCM2835,BCM2708,PlatformRPi      {$endif}
 {$ifdef TARGET_RPI2_INCLUDING_RPI3} BCM2836,BCM2709,PlatformRPi2     {$endif}
 {$ifdef TARGET_RPI3}                BCM2837,BCM2710,PlatformRPi3     {$endif}
 {$ifdef TARGET_QEMUARM7A}           QEMUVersatilePB,PlatformQemuVpb, {$endif}

 VersatilePb, PL011,
 
 Classes,Crt,Console,Devices,Framebuffer,
 FATFS,FileSystem,
 GlobalConfig,GlobalConst,
 Ip,Logging,Network,Platform,RemoteShell,Serial,ShellFilesystem,
 StrUtils,SysUtils,Transport,Ultibo,Winsock2,
 VirtualDisk,

 uInit,uSlides;

type
 TTarget = (Rpi, Rpi2, Rpi3, QemuArm7a);

function TargetToString(Target:TTarget):String;
begin
 case Target of
  Rpi: TargetToString:='Rpi';
  Rpi2: TargetToString:='Rpi2';
  Rpi3: TargetToString:='Rpi3';
  QemuArm7a: TargetToString:='QemuArm7a';
 end;
end;

var
 Target:TTarget;

procedure DetermineEntryState;
begin
 Target:={$ifdef TARGET_RPI_INCLUDING_RPI0}  Rpi       {$endif}
         {$ifdef TARGET_RPI2_INCLUDING_RPI3} Rpi2      {$endif}
         {$ifdef TARGET_RPI3}                Rpi3      {$endif}
         {$ifdef TARGET_QEMUARM7A}           QemuArm7a {$endif};
end;

procedure StartLogging;
begin
 if (Target = QemuArm7a) then
  begin
   SERIAL_REGISTER_LOGGING:=True;
   SerialLoggingDeviceAdd(SerialDeviceGetDefault);
   SERIAL_REGISTER_LOGGING:=False;
   LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_SERIAL));
  end
 else
  begin
   LoggingDeviceSetTarget(LoggingDeviceFindByType(LOGGING_TYPE_FILE),'c:\ultiboslideshow.log');
   LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_FILE));
  end;
end;

var
 Winsock2TCPClient:TWinsock2TCPClient;

const
 ScreenWidth=1920;
 ScreenHeight=1080;

var
 Fb:pFrameBufferDevice;
 FramebufferProperties:TFramebufferProperties;
 SavedFrameBuffer:Pointer;

// Initialize frame buffer to larger, typical size
procedure InitializeFrameBuffer;
begin
 SavedFrameBuffer:=nil;
 Fb:=FrameBufferDeviceGetDefault;
 FrameBufferDeviceRelease(Fb);
 Sleep(100);
 FrameBufferProperties.Depth:=32;
 FrameBufferProperties.PhysicalWidth:=ScreenWidth;
 FrameBufferProperties.PhysicalHeight:=ScreenHeight;
 FrameBufferProperties.VirtualWidth:=FrameBufferProperties.PhysicalWidth;
 FrameBufferProperties.VirtualHeight:=FrameBufferProperties.PhysicalHeight * 2;
 FrameBufferDeviceAllocate(Fb,@FrameBufferProperties);
 Sleep(100);
 FrameBufferDeviceSetDefault(Fb);
 FrameBufferDeviceGetProperties(Fb,@FrameBufferProperties);
 ConsoleWindowCreate(ConsoleDeviceGetDefault,CONSOLE_POSITION_FULLSCREEN,True);
end;

// Save frame buffer in memory and write signal to log
procedure SaveFrameBuffer;
const
 ColorFormat=COLOR_FORMAT_RGB24;
 BytesPerPixel=3;
begin
 if not Assigned(SavedFrameBuffer) then
  SavedFrameBuffer:=GetMem(ScreenWidth * ScreenHeight * BytesPerPixel);
 ConsoleDeviceGetImage(ConsoleDeviceGetDefault,0,0,SavedFrameBuffer,
                       ScreenWidth,ScreenHeight,ColorFormat,0);
 LoggingOutput(Format('frame buffer at 0x%x -size %dx%dx%d',
                      [LongWord(SavedFrameBuffer),ScreenWidth,ScreenHeight,BytesPerPixel]));
end;

var
 SlideNumber:LongWord;
 LineNumber:LongWord;
 DeviceListing:TStringList;

procedure Check(Status:Integer);
begin
 if Status <> 0 then
  raise Exception.Create(Format('Exception - status code %d',[Status]));
end;

procedure CheckNil(P:Pointer);
begin
 if not Assigned(P) then
  raise Exception.Create('Exception - unassigned pointer');
end;

function EachDevice(Device:PDevice;Data:Pointer):DWord;
begin
 DeviceListing.Add(Format('%-12s %-35s %-20s',[Device.DeviceName,Device.DeviceDescription,DeviceClassToString(Device.DeviceClass)]));
 Eachdevice:=0;
end;

function EachConsole(Console:PConsoleDevice;Data:Pointer):DWord;
var
 Properties:TConsoleProperties;
begin
 LoggingOutput(Format('TConsoleDevice.Device.DeviceName %s',[Console^.Device.DeviceName]));
 LoggingOutput(Format('TConsoleDevice.Device.DeviceDescription %s',[Console^.Device.DeviceDescription]));
 Check(ConsoleDeviceGetProperties(Console,@Properties));
 with Properties do
  begin
   LoggingOutput(SysUtils.Format('TConsoleProperties.Flags %8.8x',[Flags]));
   LoggingOutput(SysUtils.Format('TConsoleProperties.Width %u',[Width]));
   LoggingOutput(SysUtils.Format('TConsoleProperties.Height %u',[Height]));
  end;
 EachConsole:=0;
end;

function EachFrameBuffer(FrameBuffer:PFrameBufferDevice;Data:Pointer):DWord;
var
 Properties:TFrameBufferProperties;
begin
 LoggingOutput(Format('TFrameBufferDevice.Device.DeviceName %s',[FrameBuffer^.Device.DeviceName]));
 LoggingOutput(Format('TFrameBufferDevice.Device.DeviceDescription %s',[FrameBuffer^.Device.DeviceDescription]));
 Check(FrameBufferDeviceGetProperties(FrameBuffer,@Properties));
 with Properties do
  begin
   LoggingOutput(SysUtils.Format('TFrameBufferProperties.Flags %8.8x',[Flags]));
   LoggingOutput(SysUtils.Format('TFrameBufferProperties.PhysicalWidth %u',[PhysicalWidth]));
   LoggingOutput(SysUtils.Format('TFrameBufferProperties.PhysicalHeight %u',[PhysicalHeight]));
   LoggingOutput(SysUtils.Format('TFrameBufferProperties.VirtualWidth %u',[VirtualWidth]));
   LoggingOutput(SysUtils.Format('TFrameBufferProperties.VirtualHeight %u',[VirtualHeight]));
  end;
 EachFrameBuffer:=0;
end;

function EachClock(Clock:PClockDevice;Data:Pointer):DWord;
var
 Properties:TClockProperties;
begin
 LoggingOutput(Format('TClockDevice.Device.DeviceName %s',[Clock^.Device.DeviceName]));
 LoggingOutput(Format('TClockDevice.Device.DeviceDescription %s',[Clock^.Device.DeviceDescription]));
 Check(ClockDeviceProperties(Clock,@Properties));
 with Properties do
  begin
   LoggingOutput(Format('TClockProperties.Flags %8.8x',[Flags]));
   LoggingOutput(Format('TClockProperties.MinRate %f',[MinRate / (1000*1000)]));
   LoggingOutput(Format('TClockProperties.MaxRate %f',[MaxRate / (1000*1000)]));
  end;
 EachClock:=0;
end;

function EachTimer(Timer:PTimerDevice;Data:Pointer):DWord;
var
 Properties:TTimerProperties;
begin
 LoggingOutput(Format('TTimerDevice.Device.DeviceName %s',[Timer^.Device.DeviceName]));
 LoggingOutput(Format('TTimerDevice.Device.DeviceDescription %s',[Timer^.Device.DeviceDescription]));
 Check(TimerDeviceProperties(Timer,@Properties));
 with Properties do
  begin
   LoggingOutput(Format('TTimerProperties.Bits %d',[Bits]));
   LoggingOutput(Format('TTimerProperties.Flags %8.8x',[Flags]));
   LoggingOutput(Format('TTimerProperties.MinRate %f',[MinRate / (1000*1000)]));
   LoggingOutput(Format('TTimerProperties.MaxRate %f',[MaxRate / (1000*1000)]));
   LoggingOutput(Format('TTimerProperties.MinInterval %f',[MinInterval / (1000*1000)]));
   LoggingOutput(Format('TTimerProperties.MaxInterval %f',[MaxInterval / (1000*1000)]));
  end;
 EachTimer:=0;
end;

procedure LogFeatures;
var
 S:String;
begin
 DeviceListing:=TStringList.Create;
 Check(DeviceEnumerate(DEVICE_CLASS_ANY,EachDevice,nil));
 DeviceListing.Sort;
 for S in DeviceListing do
  LoggingOutput(S);
 LoggingOutput('');
 Check(ConsoleDeviceEnumerate(EachConsole,nil));
 Check(FrameBufferDeviceEnumerate(EachFrameBuffer,nil));
 Check(ClockDeviceEnumerate(EachClock,nil));
 Check(TimerDeviceEnumerate(EachTimer,nil));
end;

procedure TestSerialDevice(DeviceName:String);
var
 SerialDevice:PSerialDevice;
 Count:Cardinal;
 TestString:String;
begin
 TestString:=DeviceName + ' SerialDeviceWrite test' + Char(13) + Char(10);
 SerialDevice:=SerialDeviceFindByName(DeviceName);
 CheckNil(SerialDevice);
 Check(SerialDeviceOpen(SerialDevice,9600,SERIAL_DATA_8BIT,SERIAL_STOP_1BIT,SERIAL_PARITY_NONE,SERIAL_FLOW_NONE,0,0));
 Check(SerialDeviceWrite(SerialDevice,PChar(TestString),Length(TestString),SERIAL_WRITE_NONE,Count));
 if Count <> Length(TestString) then
  raise Exception.Create('Exception - serial length');
end;

procedure TestSerial;
begin
 PL011UARTCreate(VERSATILEPB_UART1_REGS_BASE,'',VERSATILEPB_IRQ_UART1,PL011_UART_CLOCK_RATE);
 PL011UARTCreate(VERSATILEPB_UART2_REGS_BASE,'',VERSATILEPB_IRQ_UART2,PL011_UART_CLOCK_RATE);
 PL011UARTCreate(VERSATILEPB_UART3_REGS_BASE,'',VERSATILEPB_IRQ_SIC_UART3,PL011_UART_CLOCK_RATE);
 TestSerialDevice('Serial1');
 TestSerialDevice('Serial2');
 TestSerialDevice('Serial3');
end;

type
 TAdapterTool = class
  function EachAdapter(NetworkAdapter:TNetworkAdapter):Boolean;
  procedure LogAdapters;
 end;

function TAdapterTool.EachAdapter(NetworkAdapter:TNetworkAdapter):Boolean;
begin
 LoggingOutput(Format('TNetworkAdapter %s',[NetworkAdapter.Name]));
 EachAdapter:=True;
end;

procedure TAdapterTool.LogAdapters;
begin
 LoggingOutput('');
 AdapterManager.EnumerateAdapters(EachAdapter);
 LoggingOutput('');
end;

var
 IpAddress:String;

function GetIpAddress:String;
begin
 Result:=Winsock2TCPClient.LocalAddress;
 while (Result = '') or (Result = '0.0.0.0') or (Result = '255.255.255.255') do
  begin
   Sleep(100);
   Result:=Winsock2TCPClient.LocalAddress;
  end;
 LoggingOutput(Format('IP address %s',[Result]));
end;

procedure Main;
begin
 DetermineEntryState;
 StartLogging;
 InitializeFrameBuffer;
 Sleep(1000);
 Winsock2TCPClient:=TWinsock2TCPClient.Create;
 IpAddress:=GetIpAddress;
 TestSerial;
 LoggingOutput('');
 LoggingOutput(Format('BoardType %s',[BoardTypeToString(BoardGetType)]));
 LoggingOutput(Format('Ultibo Release %s %s %s',[ULTIBO_RELEASE_DATE,ULTIBO_RELEASE_NAME,ULTIBO_RELEASE_VERSION]));
 LogFeatures;
 TAdapterTool.Create.LogAdapters;
 SlideNumber:=SlidesFirstSlideNumber;
 while True do
  begin
   LoggingOutput('frame start');
   ClrScr;
   GotoXY(1,1);
   WriteLn(Format('Slide number %d',[SlideNumber]));
   with Slides.Slides[SlideNumber] do
    for LineNumber:= 1 to NumberOfLines do
     WriteLn(Lines[LineNumber]);
   LoggingOutput('frame end');
   SaveFrameBuffer;
   Sleep(5*1000);
   SlideNumber:=SlidesNextSlideNumber(SlideNumber);
   if SlideNumber = SlidesFirstSlideNumber then
    LoggingOutput('program stop');
  end;
end;

procedure CreateRamDisk;
var
 ImageNo:Integer;
 Device:TDiskDevice;
 Volume:TDiskVolume;
 Drive:TDiskDrive;
begin
 ImageNo:=FileSysDriver.CreateImage(0,'NTFS RAM Disk',itMEMORY,mtFIXED,ftUNKNOWN,iaDisk or iaReadable or iaWriteable,512,204800,0,0,0,pidUnused);
 if ImageNo <> 0 then
  begin
   if FileSysDriver.MountImage(ImageNo) then
    begin
     Device:=FileSysDriver.GetDeviceByImage(FileSysDriver.GetImageByNo(ImageNo,False,FILESYS_LOCK_NONE),False,FILESYS_LOCK_NONE);
     if Device <> nil then
      begin
       Volume:=FileSysDriver.GetVolumeByDevice(Device,False,FILESYS_LOCK_NONE);
       if Volume <> nil then
        begin
         if FileSysDriver.FormatVolume(Volume.Name,ftUNKNOWN,fsFAT12) then
          begin
           Drive:=FileSysDriver.GetDriveByVolume(Volume,False,FILESYS_LOCK_NONE);
           if Drive <> nil then
            begin
            end;
          end;
        end;
      end;
    end;
  end;
end;

begin
 try
  Main;
 except on E:Exception do
  begin
   WriteLn(Format('Exception.Message %s',[E.Message]));
   LoggingOutput(Format('Exception.Message %s',[E.Message]));
   LoggingOutput('program stop');
   Sleep(1000);
  end;
 end;
end.

procedure Msg (Sender : TObject; s : string);
begin
  ConsoleWindowWriteLn (WindowHandle, s);
end;

begin
  SetOnMsg (@Msg);
end.
