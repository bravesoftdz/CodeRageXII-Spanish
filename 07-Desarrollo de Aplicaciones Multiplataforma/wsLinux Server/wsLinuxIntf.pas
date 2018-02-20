{ Invokable interface IwsLinux }

unit wsLinuxIntf;

interface

uses
  System.Classes,
  System.Types,
  Soap.InvokeRegistry,
  Soap.XSBuiltIns;

type

  { Invokable interfaces must derive from IInvokable }
  IwsLinux = interface(IInvokable)
  ['{BAACB823-25D8-4134-B9D1-2AE7E039763A}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
    function getFormaDePago(clave: string): String; stdcall;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(IwsLinux));

end.
