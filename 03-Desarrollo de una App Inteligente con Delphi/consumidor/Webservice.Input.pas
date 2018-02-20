unit Webservice.Input;

interface

uses Classes, Generics.Collections, System.Json;

type

TInput = class
private
  FLabels: TArray<string>;
public
  property Labels: TArray<string> read FLabels write FLabels;
  function Json: TJSONValue;
end;

implementation

{TInput}

function TInput.Json: TJSONValue;
var
  jvInput: TJSONArray;
  jvPair: TJSONPair;
  i: integer;
begin
  jvInput:= TJSONArray.Create;
  for i:= 0 to Pred(Length(FLabels)) do
    jvInput.AddElement(TJSONObject.Create(TJSONPair.Create('labels', FLabels[i])));
  result := jvInput;
end;

end.
