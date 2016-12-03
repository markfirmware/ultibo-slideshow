program pSlideShow;
{$mode objfpc}{$H+}

uses
 {$Ifdef BUILD_RPI}  BCM2835, BCM2708, {$Endif}
 {$Ifdef BUILD_RPI2} BCM2836, BCM2709, {$Endif}
 {$Ifdef BUILD_RPI3} BCM2837, BCM2710, {$Endif}
 {$Ifdef BUILD_QEMU} QEMUVersatilePB,  {$Endif}
 SysUtils, Crt;

var
 PhotoNumber:LongWord;

begin
 PhotoNumber:=1;
 while True do
  begin
   GotoXY(1,1);
   WriteLn(Format('Photo number %d',[PhotoNumber]));
   Sleep(30*1000);
   Inc(PhotoNumber);
  end;
end.
