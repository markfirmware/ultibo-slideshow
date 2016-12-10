program pSlideShow;
{$mode delphi}{$h+}

uses
 {$Ifdef TARGET_RPI_INCLUDING_RPI0}  BCM2835, BCM2708, {$Endif}
 {$Ifdef TARGET_RPI2_INCLUDING_RPI3} BCM2836, BCM2709, {$Endif}
 {$Ifdef TARGET_RPI3}                BCM2837, BCM2710, {$Endif}
 {$Ifdef TARGET_QEMU32}              QEMUVersatilePB,  {$Endif}
 SysUtils, GlobalConfig, Platform, Serial, Logging, Crt;

type
 TTarget = (Rpi, Rpi2, Rpi3, Qemu32);

function TargetToString(Target:TTarget):String;
begin
 case Target of
  Rpi: TargetToString:='Rpi';
  Rpi2: TargetToString:='Rpi2';
  Rpi3: TargetToString:='Rpi3';
  Qemu32: TargetToString:='Qemu32';
 end;
end;

var
 Target:TTarget;

procedure DetermineEntryState;
begin
 Target:={$Ifdef TARGET_RPI_INCLUDING_RPI0}  Rpi    {$Endif}
         {$Ifdef TARGET_RPI2_INCLUDING_RPI3} Rpi2   {$Endif}
         {$Ifdef TARGET_RPI3}                Rpi3   {$Endif}
         {$Ifdef TARGET_QEMU32}              Qemu32 {$Endif};
end;

var
 PhotoNumber:LongWord;

procedure StartLogging;
begin
 if (Target = Qemu32) then
  begin
   SERIAL_REGISTER_LOGGING:=True;
   SerialLoggingDeviceAdd(SerialDeviceGetDefault);
   LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_SERIAL));
  end
 else
  begin
   LoggingDeviceSetTarget(LoggingDeviceFindByType(LOGGING_TYPE_FILE),'c:\ultibo.log');
   //The next line normally isn't required but FileSysLoggingStart currently has
   // a bug that causes it to fail if no target is specified on the command line
   LoggingDeviceStart(LoggingDeviceFindByType(LOGGING_TYPE_FILE));
   LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_FILE));
  end;
end;

begin
 DetermineEntryState;
 StartLogging;
 LoggingOutput(Format('Target %s',[TargetToString(Target)]));
 PhotoNumber:=1;
 while True do
  begin
   LoggingOutput('new frame');
   GotoXY(1,1);
   WriteLn(Format('Photo number %d',[PhotoNumber]));
   Sleep(5*1000);
   Inc(PhotoNumber);
  end;
end.
