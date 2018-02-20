unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, FMX.StdCtrls, FMX.Edit,
  FMX.Controls.Presentation, FMX.Memo;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StatusBar1: TStatusBar;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Idx: Integer;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.Macintosh.fmx MACOS}
{$R *.iPhone55in.fmx IOS}
{$R *.iPhone.fmx IOS}

uses wsLinuxClass;

procedure TForm1.Button1Click(Sender: TObject);
var
  servicio: IwsLinux;
  response: string;
  Lista: TStrings;
  separador1,
  separador2,
  separador3: Array of String;
  Registro,
  Campo: TArray<string>;
  I: Integer;
  K: Integer;
begin
  for K := 0 to Idx do
  begin
    StringGrid1.Cells[0,K] := '';
    StringGrid1.Cells[1,K] := '';
  end;
  servicio := GetIwsLinux;
  response := servicio.getFormaDePago(Edit1.Text);
  Lista := TStringList.Create;
  Lista.Delimiter := ',';
  Lista.StrictDelimiter := true;
  Lista.CommaText := response;
  separador1 := [#$A];
  separador3 := [''];
  {$IFDEF MSWINDOWS}
  separador1 := [#$D#$A];
  separador3 := [#$A];
  {$ENDIF}
  {$IFDEF ANDROID}
  separador1 := [#010];
  separador3 := [''];
  {$ENDIF}
  Registro := Lista.Text.Split(separador1);
  separador2 := ['|'];
  Idx := 0;
  for I := 0 to length(Registro)-1 do
  begin
    if not Registro[I].IsEmpty then
    begin
      Campo := Registro[I].Split(separador2);
      if Campo[0] <> separador3[0] then
      begin
        StringGrid1.Cells[0,Idx] := Campo[1];
        StringGrid1.Cells[1,Idx] := Campo[2];
        Inc(Idx);
      end;
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  StringGrid1.Columns[0].Width := 70;
  StringGrid1.Columns[1].Width := 230;
  Idx := 0;
end;

end.
