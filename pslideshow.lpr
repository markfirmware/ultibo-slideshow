program pSlideShow;
{$mode delphi}{$h+}

uses
 {$ifdef TARGET_RPI_INCLUDING_RPI0}  BCM2835, BCM2708, {$endif}
 {$ifdef TARGET_RPI2_INCLUDING_RPI3} BCM2836, BCM2709, {$endif}
 {$ifdef TARGET_RPI3}                BCM2837, BCM2710, {$endif}
 {$ifdef TARGET_QEMUARM7A}           QEMUVersatilePB,  {$endif}
 StrUtils, SysUtils, GlobalConfig, Platform, Serial, Logging, Crt, uInit, uSlides;

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

var
 SlideNumber:LongWord;
 LineNumber:LongWord;

begin
 DetermineEntryState;
 StartLogging;
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
  end;
end.
