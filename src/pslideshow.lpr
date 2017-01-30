program pSlideShow;
{$mode delphi}{$h+}

uses
 {$ifdef TARGET_RPI_INCLUDING_RPI0}  BCM2835, BCM2708, {$endif}
 {$ifdef TARGET_RPI2_INCLUDING_RPI3} BCM2836, BCM2709, {$endif}
 {$ifdef TARGET_RPI3}                BCM2837, BCM2710, {$endif}
 {$ifdef TARGET_QEMUARM7A}           QEMUVersatilePB,  {$endif}
 StrUtils,SysUtils,Framebuffer,GlobalConfig,GlobalConst,Platform,Serial,Logging,Console,Crt,uInit,uSlides;

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
   LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_SERIAL));
  end
 else
  begin
   LoggingDeviceSetTarget(LoggingDeviceFindByType(LOGGING_TYPE_FILE),'c:\ultiboslideshow.log');
   LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_FILE));
  end;
end;

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

begin
 DetermineEntryState;
 StartLogging;
 InitializeFrameBuffer;
 LoggingOutput(Format('Target %s',[TargetToString(Target)]));
 SlideNumber:=SlidesFirstSlideNumber;
 while True do
  begin
   LoggingOutput('new frame');
   ClrScr;
   GotoXY(1,1);
   WriteLn(Format('Slide number %d',[SlideNumber]));
   with Slides.Slides[SlideNumber] do
    if Target = QemuArm7a then
     begin
      for LineNumber:= 1 to Min(NumberOfLines,40) do
       WriteLn(AnsiLeftStr(Lines[LineNumber],80));
     end
    else
     begin
      for LineNumber:= 1 to NumberOfLines do
       WriteLn(Lines[LineNumber]);
     end;
   Sleep(5*1000);
   SlideNumber:=SlidesNextSlideNumber(SlideNumber);
   if SlideNumber = SlidesFirstSlideNumber then
    LoggingOutput('program stop');
  end;
end.
