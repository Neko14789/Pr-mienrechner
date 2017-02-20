program project1;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

uses
{$IFNDEF FPC}
{$ELSE}
  Interfaces,
{$ENDIF}
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Prämienrechner';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
