// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.1.73:8080/wsdl/IwsLinux
// Encoding : utf-8
// Version  : 1.0
// (10/02/2018 10:36:59 p. m. - - $Rev: 90173 $)
// ************************************************************************ //

unit wsLinuxClass;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : urn:wsLinuxIntf-IwsLinux
  // soapAction: urn:wsLinuxIntf-IwsLinux#getFormaDePago
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : IwsLinuxbinding
  // service   : IwsLinuxservice
  // port      : IwsLinuxPort
  // URL       : http://192.168.1.73:8080/soap/IwsLinux
  // ************************************************************************ //
  IwsLinux = interface(IInvokable)
  ['{D6A6A579-F9C0-381C-82D0-2034E80DB53B}']
    function  getFormaDePago(const clave: string): string; stdcall;
  end;

function GetIwsLinux(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IwsLinux;


implementation
  uses System.SysUtils;

function GetIwsLinux(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IwsLinux;
const
  defWSDL = 'http://192.168.1.64:8080/wsdl/IwsLinux';
  defURL  = 'http://192.168.1.64:8080/soap/IwsLinux';
  defSvc  = 'IwsLinuxservice';
  defPrt  = 'IwsLinuxPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IwsLinux);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { IwsLinux }
  InvRegistry.RegisterInterface(TypeInfo(IwsLinux), 'urn:wsLinuxIntf-IwsLinux', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IwsLinux), 'urn:wsLinuxIntf-IwsLinux#getFormaDePago');

end.