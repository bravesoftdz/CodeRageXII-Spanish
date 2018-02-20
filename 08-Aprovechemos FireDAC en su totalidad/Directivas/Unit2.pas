unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs;

type
  TForm2 = class(TForm)
    DBFirebird: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btSQLite: TButton;
    btFirebird: TButton;
    DBSQLIte: TFDConnection;
    procedure btSQLiteClick(Sender: TObject);
    procedure DBFirebirdLost(Sender: TObject);
    procedure DBFirebirdRecover(ASender, AInitiator: TObject; AException: Exception;
      var AAction: TFDPhysConnectionRecoverAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btSQLiteClick(Sender: TObject);
var
  vBoton: TButton absolute Sender;
begin
  if vBoton.Name = 'btFirebird' then
    FDQuery1.Connection := DBFirebird
  else
    FDQuery1.Connection := DBSQLIte;


  FDQuery1.Close;
  FDQuery1.Open;
end;

procedure TForm2.DBFirebirdLost(Sender: TObject);
begin
  ShowMessage('Se ha perdido la conexión');
end;

procedure TForm2.DBFirebirdRecover(ASender, AInitiator: TObject; AException: Exception;
  var AAction: TFDPhysConnectionRecoverAction);
begin
  AAction := faRetry;
end;

end.
