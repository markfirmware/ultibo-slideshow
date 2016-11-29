program pSlideShow;
{$mode objfpc}{$H+}

uses
 BCM2837, BCM2710, SysUtils, Crt;

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
