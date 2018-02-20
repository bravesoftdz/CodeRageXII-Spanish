{ Invokable implementation File for TwsLinux which implements IwsLinux }

unit wsLinuxImpl;

interface

uses
  System.IOUtils,
  System.SysUtils,
  System.Classes,
  Soap.InvokeRegistry,
  System.Types,
  Soap.XSBuiltIns,
  wsLinuxIntf;

type

  { TwsLinux }
  TwsLinux = class(TInvokableClass, IwsLinux)
  public
    function getFormaDePago(clave: string): String; stdcall;
  end;

implementation


{ TwsLinux }

function TwsLinux.getFormaDePago(clave: string): String;
var
  archivo: string;
  StrList: TStrings;
  I: Integer;
  Lista: TStrings;

begin
  {$IFDEF MSWINDOWS}
    archivo := ExtractFilePath(ParamStr(0)) + 'lista.txt';
  {$ELSE}
    archivo := TPath.Combine(TPath.GetHomePath, 'lista.txt');
  {$ENDIF}
  Lista := TStringList.Create;
  StrList := TStringList.Create;
  StrList.LoadFromFile( archivo );
  for I := 0 to StrList.Count-1 do
  begin
    if clave = 'T' then
       lista := StrList
    else
    if Pos(clave, StrList[I]) <> 0 then
       lista.Add(StrList[I]);
  end;
  Result := Lista.Text;
  FreeAndNil(StrList);
  FreeAndNil(Lista);
end;

initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(TwsLinux);
end.

