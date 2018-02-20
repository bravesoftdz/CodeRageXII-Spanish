unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TfrmMain = class(TForm)
    lblEtiquetas1: TLabel;
    numEtiquetas1: TSpinEdit;
    lblEtiquetas2: TLabel;
    numEtiquetas2: TSpinEdit;
    lblEtiquetas3: TLabel;
    numEtiquetas3: TSpinEdit;
    btnPredecir: TButton;
    procedure btnPredecirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Webservice, Webservice.Interfaces, Webservice.Input, Webservice.Output;

procedure TfrmMain.btnPredecirClick(Sender: TObject);
var
  Webservice: TWebservice;
  Input: TInput;
  Response: IWebserviceResponse;
  Output: TOutput;
  i: integer;
begin
  Webservice:= TWebservice.Create;
  Webservice.SetBaseURI('https://smartappdelphi.herokuapp.com/predict');
  Input:= TInput.Create;
  Input.Labels:= [numEtiquetas1.Text, numEtiquetas2.Text, numEtiquetas3.Text];
  Response := Webservice.Post([], Input.Json);
  Output:= TOutput.FromJsonString(Response.ContentAsString);
  for i:= 0 to Pred(output.Values.Count) do
    ShowMessage(Output.Values[i]);
  Output.Free;
  Input.Free;
end;

end.
