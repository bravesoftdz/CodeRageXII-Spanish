unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.CheckLst,
  Vcl.ExtCtrls, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Grids;

type
  TfrmMain = class(TForm)
    txtForm: TEdit;
    txtStats: TEdit;
    OpenDialog: TOpenDialog;
    btnForm: TButton;
    btnStats: TButton;
    btnAdd: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnFormClick(Sender: TObject);
    procedure btnStatsClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  System.Generics.Collections, System.IniFiles;

procedure TfrmMain.btnAddClick(Sender: TObject);
var
  FollowLink: Boolean;
  IniFile: TIniFile;
  Secs: String;
  Controles: TStringList;
  Words: String;
  Word: String;
  Counts: TDictionary<String, Integer>;
  Count: Integer;
  Key: String;
  Line: String;
  myFile: TextFile;
begin
  IniFile:=  TIniFile.Create(txtStats.Text);
  Controles:= TStringList.Create;
  Counts:= TDictionary<String, Integer>.Create;
  try
    Counts.Add('TLabel', 0);
    //Counts.Add('TEdit', 0);
    //Counts.Add('TButton', 0);
    if FileExists(txtForm.Text, FollowLink) and
      FileExists(txtStats.Text, FollowLink) then
    begin
      Secs:= IniFile.ReadString('Stats', 'DesignerSecs', EmptyStr);
      Controles.LoadFromFile(txtForm.Text);
      for Words in Controles do
      begin
        for Word in Words.Split([' ']) do
        begin
          if Counts.ContainsKey(Word) then
          begin
            Counts.TryGetValue(Word, Count);
            Counts.AddOrSetValue(Word, Succ(Count));
          end;
        end;
      end;
    end;
    Counts.TryGetValue('TLabel', Count);
    Line:= Line + IntToStr(Count) + ',';
    //Counts.TryGetValue('TEdit', Count);
    //Line:= Line + IntToStr(Count) + ',';
    //Counts.TryGetValue('TButton', Count);
    //Line:= Line + IntToStr(Count) + ',';
    Line:= Line + Secs;
    AssignFile(myFile, '../train.csv');
    if FileExists(ExtractFilePath(Application.ExeName) + '../train.csv', FollowLink) then
      Append(myFile)
    else
    begin
      ReWrite(myFile);
      WriteLn(myFile,
        'labels,' +
        //'edits,' +
        //'buttons,' +
        'time');
    end;
    WriteLn(myFile, Line);
    CloseFile(myFile);
  finally
    Counts.Free;
    Controles.Free;
    IniFile.Free;
  end;
end;

procedure TfrmMain.btnFormClick(Sender: TObject);
begin
  OpenDialog.FileName:= EmptyStr;
  OpenDialog.Filter:= 'Delphi dfm|*.dfm';
  if OpenDialog.Execute then
    txtForm.Text:= OpenDialog.FileName;
end;

procedure TfrmMain.btnStatsClick(Sender: TObject);
begin
  OpenDialog.FileName:= EmptyStr;
  OpenDialog.Filter:= 'Delphi stats|*.stat';
  if OpenDialog.Execute then
    txtStats.Text:= OpenDialog.FileName;
end;

end.
