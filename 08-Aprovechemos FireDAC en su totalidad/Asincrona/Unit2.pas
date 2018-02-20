unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.VCLUI.Wait, FireDAC.VCLUI.Async, System.Threading, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    DemocoderagexiiConnection: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Abrir: TButton;
    FDGUIxAsyncExecuteDialog1: TFDGUIxAsyncExecuteDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    procedure AbrirClick(Sender: TObject);
    procedure DemocoderagexiiConnectionLost(Sender: TObject);
    procedure DemocoderagexiiConnectionRecover(ASender, AInitiator: TObject; AException: Exception;
      var AAction: TFDPhysConnectionRecoverAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.AbrirClick(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.Open;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  ProgressBar1.State := TProgressBarState.pbsNormal;
  TTask.Run(
    procedure
    var
      vQ: TFDQuery;
      vFDConnection: TFDConnection;
    begin
      vFDConnection := TFDConnection.Create(nil);
      vQ := TFDQuery.Create(nil);
      try
        vFDConnection.Params := DemocoderagexiiConnection.Params;
        vQ.Connection := vFDConnection;

        vQ.Open('select CODIGO, NOMBRE, DIRECCION, TELEFONO, EMAIL from sp_lento');

        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            DataSource1.DataSet := vQ;
            ProgressBar1.State := TProgressBarState.pbsPaused;
          end);

      finally
        //vQ.DisposeOf;
      end;
    end);
end;

procedure TForm2.DemocoderagexiiConnectionLost(Sender: TObject);
begin
  ShowMessage('Se ha perdido la conexión');
end;

procedure TForm2.DemocoderagexiiConnectionRecover(ASender, AInitiator: TObject; AException: Exception;
var AAction: TFDPhysConnectionRecoverAction);
begin
  AAction := faRetry;
end;

end.
