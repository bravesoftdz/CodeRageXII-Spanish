unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FMX.Controls.Presentation, FMX.StdCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.DBScope, FMX.WebBrowser, FMX.Edit, FMX.Layouts;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    btnConsumir: TButton;
    FDMemTable1id: TStringField;
    FDMemTable1first_name: TStringField;
    FDMemTable1last_name: TStringField;
    FDMemTable1avatar: TStringField;
    TabControl1: TTabControl;
    Tab1: TTabItem;
    Tab2: TTabItem;
    lvDatos: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    edtNombre: TEdit;
    Web: TWebBrowser;
    Button1: TButton;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    procedure btnConsumirClick(Sender: TObject);
    procedure lvDatosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Button1Click(Sender: TObject);
  private
    procedure ConsumirREST;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TForm1.btnConsumirClick(Sender: TObject);
begin
   ConsumirREST;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   TabControl1.TabIndex := 0;
end;

procedure TForm1.ConsumirREST;
begin
   FDMemTable1.Close;
   RESTRequest1.Execute;
   FDMemTable1.Open;
end;

procedure TForm1.lvDatosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  Id: Integer;
begin
    if TryStrToInt(LinkFillControlToField1.BindList.GetSelectedValue.AsString, Id) then
     begin
       FDMemTable1.Locate('id',Id,[]);
       edtNombre.Text := FDMemTable1.FieldByName('first_name').AsString + ' ' +
                         FDMemTable1.FieldByName('last_name').AsString;
       Web.URL := FDMemTable1.FieldByName('avatar').AsString;
       Web.Navigate;

       TabControl1.TabIndex := 1;
     end;
end;


end.
