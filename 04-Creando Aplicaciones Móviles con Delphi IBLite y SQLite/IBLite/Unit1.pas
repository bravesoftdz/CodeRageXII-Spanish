unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBLiteDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.DB, FMX.StdCtrls, FMX.Controls.Presentation,
  Data.Bind.Components, Data.Bind.DBScope, FMX.ListView, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Edit, FMX.TabControl;

type
  TForm1 = class(TForm)
    MyemployeeConnection: TFDConnection;
    EmpleadoTable: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    ToolBar1: TToolBar;
    Button1: TButton;
    Button2: TButton;
    EmpleadoTableEMP_NO: TIntegerField;
    EmpleadoTableFIRST_NAME: TStringField;
    EmpleadoTableLAST_NAME: TStringField;
    EmpleadoTablePHONE_EXT: TStringField;
    EmpleadoTableHIRE_DATE: TSQLTimeStampField;
    EmpleadoTableDEPT_NO: TIntegerField;
    EmpleadoTableJOB_COUNTRY: TStringField;
    EmpleadoTableSALARY: TBCDField;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListView1: TListView;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    Edit8: TEdit;
    LinkControlToField8: TLinkControlToField;
    LinkListControlToField2: TLinkListControlToField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EmpleadoTableAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}

procedure TForm1.Button1Click(Sender: TObject);
begin
 EmpleadoTable.Append;
 TabControl1.ActiveTab := TabItem2;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 EmpleadoTable.Post;
 EmpleadoTable.Refresh;
 TabControl1.ActiveTab := TabItem1;
end;

procedure TForm1.EmpleadoTableAfterPost(DataSet: TDataSet);
begin
 //MyemployeeConnection.CommitRetaining;
end;

end.
