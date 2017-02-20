unit Unit1;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  Windows,
{$ELSE}
  LCLIntf, LCLType, LMessages,
{$ENDIF}
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  bz,p:real;

implementation

{$R *.dfm}


{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  If edit1.Text='' then
     begin
       ShowMessage('Bitte die Anzahl der Jahre mit Betriebszugehörigkeit angeben');
       Exit;
     end;
  bz:=strtofloat(edit1.text);
  IF bz<1 then                                                           //'IF NOT (bz>=1)'ist wichtig da sonst 1 Jahr als keine Prämie gilt somit würde 'If bz<=1' bei einem Jahr keine Prämie geben
     begin
       p:=0;
     end else
     begin
       p:=200;
       begin
         if bz>=6 then
            begin
              p:=p+80+bz*20;
              If RadioButton2.Checked then
                 begin
                   p:=p+50;
                 end;
            end;
       end;
     end;
     edit2.text:=FloatToStr(p);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit1.clear;
  edit2.clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  If Not (Key In['0','1','2','3','4','5','6','7','8','9',#8,#3,#1,#24] ) then
  Begin                                                                         //Beginn
        ShowMessage('Bitte eine Zahl eingeben!');                               //Zeige Nachricht "Bitte eine Zahl eingeben! Erlaubt sind: 0-9 , . -"
        Key:=#0;                                                                //Verbietet Eingabe des beliebigen Symbols (da es nicht erlaubt ist)
  End;
end;
end.
