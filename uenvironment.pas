unit uEnvironment;
{$mode delphi}{$h+}

interface

type
 TTarget = (Rpi, Rpi2, Rpi3, QemuArm7a);

procedure DetermineEntryState;
function TargetToString(Target:TTarget):String;

var
 Target:TTarget;

implementation

function TargetToString(Target:TTarget):String;
begin
 case Target of
  Rpi: TargetToString:='Rpi';
  Rpi2: TargetToString:='Rpi2';
  Rpi3: TargetToString:='Rpi3';
  QemuArm7a: TargetToString:='QemuArm7a';
 end;
end;

procedure DetermineEntryState;
begin
 Target:={$ifdef TARGET_RPI_INCLUDING_RPI0}  Rpi       {$endif}
         {$ifdef TARGET_RPI2_INCLUDING_RPI3} Rpi2      {$endif}
         {$ifdef TARGET_RPI3}                Rpi3      {$endif}
         {$ifdef TARGET_QEMUARM7A}           QemuArm7a {$endif};
end;

initialization
DetermineEntryState;
end.
