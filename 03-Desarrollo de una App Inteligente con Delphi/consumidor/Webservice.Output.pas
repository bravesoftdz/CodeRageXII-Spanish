unit Webservice.Output;

interface

uses Classes, Generics.Collections, System.Json;

type

TOutput = class
private
  FValues: TStrings;
public
  property Values: TStrings read FValues write FValues;
  constructor Create(AJsonString: string);
  destructor Destroy; override;
  class function FromJsonString(AJsonString: string): TOutput;
end;

implementation

{TOutput}

constructor TOutput.Create(AJsonString: string);
var
  jvValue: TJSONObject;
  jvValues: TJSONArray;
  i: Integer;
begin
  jvValue:= TJSONObject.ParseJSONValue(AJsonString) as TJSONObJect;
  jvValues:= jvValue.GetValue('prediction') as TJSONArray;
  FValues:= TStringList.Create;
  for i:= 0 to Pred(jvValues.Count) do
    FValues.Add(jvValues.Items[i].Value);
end;

destructor TOutput.Destroy;
begin
  FValues.Free;
  inherited;
end;

class function TOutput.FromJsonString(AJsonString: string): TOutput;
begin
  result := TOutput.Create(AJsonString);
end;


end.
