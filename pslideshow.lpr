program pSlideShow;
{$mode delphi}{$h+}

uses
 {$ifdef TARGET_RPI_INCLUDING_RPI0}  BCM2835, BCM2708, {$endif}
 {$ifdef TARGET_RPI2_INCLUDING_RPI3} BCM2836, BCM2709, {$endif}
 {$ifdef TARGET_RPI3}                BCM2837, BCM2710, {$endif}
 {$ifdef TARGET_QEMUARM7A}           QEMUVersatilePB,  {$endif}
 StrUtils, SysUtils, GlobalConfig, Platform, Serial, Logging, Crt, uInit, uSlides, uEnvironment;

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

var
 SlideNumber:LongWord;
 LineNumber:LongWord;

begin
 StartLogging;
 Sleep(3000);
 LoggingOutput(Format('Target %s',[TargetToString(Target)]));
 LoggingOutput(Format('cmdline.txt <%s>',[CmdLine]));
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
  end;
end.
