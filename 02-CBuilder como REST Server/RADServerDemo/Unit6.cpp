//---------------------------------------------------------------------------
#pragma hdrstop

#include "Unit6.h"
#include <memory>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TCountryResource1::TCountryResource1(TComponent* Owner)
	: TDataModule(Owner)
{
}

void TCountryResource1::Get(TEndpointContext* AContext, TEndpointRequest* ARequest,
	TEndpointResponse* AResponse)
{
	if(!CountryTable->Active) { CountryTable->Active = true; }
	std::unique_ptr<TJSONArray> LRows(new TJSONArray());
  CountryTable->First();
	while(!CountryTable->Eof) {
		TJSONObject * LRow = new TJSONObject();
		LRow->AddPair("country", CountryTable->FieldByName("country")->AsString);
		LRow->AddPair("currency", CountryTable->FieldByName("currency")->AsString);
		LRows->AddElement(LRow);
		CountryTable->Next();
	}
	CountryTable->Active = false;
	// Armar el JSON de retorno
	AResponse->Body->SetValue(LRows.release(), true);
}

void TCountryResource1::GetItem(TEndpointContext* AContext, TEndpointRequest* ARequest,
	TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
	std::unique_ptr<TJSONObject> _return(new TJSONObject());
	std::unique_ptr<TFDQuery> LQry(new TFDQuery(NULL));
	LQry->Connection = EmployeeConnection;
	LQry->SQL->Text = "select currency from country where country = :country";
	LQry->Params->ParamByName("country")->Value = item;
	LQry->Active = true;
	if(!LQry->Eof) {
		_return->AddPair("country", item);
		_return->AddPair("currency", LQry->FieldByName("currency")->AsString);
	}
	else {
		AResponse->RaiseNotFound("database", "Registro no encontrado");
	}
	LQry->Active = false;
	// Armar el JSON de retorno
	AResponse->Body->SetValue(_return.release(), true);
}

void TCountryResource1::Post(TEndpointContext* AContext, TEndpointRequest* ARequest,
	TEndpointResponse* AResponse)
{
  std::unique_ptr<TJSONObject> _return(new TJSONObject());
	TJSONObject * LRequest = ARequest->Body->GetObjectA();
	String LCountry(""), LCurrency("");
	if(LRequest->TryGetValue<String>("country", LCountry) &&
		LRequest->TryGetValue<String>("currency", LCurrency))
	{
		std::unique_ptr<TFDQuery> LInsert(new TFDQuery(NULL));
		LInsert->Connection = EmployeeConnection;
		LInsert->SQL->Text = "insert into country (country, currency) values (:country, :currency)";
		LInsert->Params->ParamByName("country")->Value = LCountry;
		LInsert->Params->ParamByName("currency")->Value = LCurrency;
		try {
			LInsert->ExecSQL();
			_return->AddPair("coderror", new TJSONNumber(0));
		}
		catch(...) {
			AResponse->RaiseError(-100, "error", "Error insertando el registro");
		}
	}
	AResponse->Body->SetValue(_return.release(), true);
}

void TCountryResource1::PutItem(TEndpointContext* AContext, TEndpointRequest* ARequest,
	TEndpointResponse* AResponse)
{
  String item;
	item = ARequest->Params->Values["item"];
	std::unique_ptr<TJSONObject> _return(new TJSONObject());
	TJSONObject * LRequest = ARequest->Body->GetObjectA();
	String LCountry(""), LCurrency("");
	if(LRequest->TryGetValue<String>("country", LCountry) &&
		LRequest->TryGetValue<String>("currency", LCurrency)) {
		std::unique_ptr<TFDQuery> LInsert(new TFDQuery(NULL));
		LInsert->Connection = EmployeeConnection;
		LInsert->SQL->Text = "update country set currency = :currency where country = :country";
		LInsert->Params->ParamByName("country")->Value = LCountry;
		LInsert->Params->ParamByName("currency")->Value = LCurrency;
		try {
			LInsert->ExecSQL();
			_return->AddPair("coderror", new TJSONNumber(0));
		}
		catch(...) {
			AResponse->RaiseError(-100, "error", "Error insertando el registro");
		}
	}
	AResponse->Body->SetValue(_return.release(), true);
}

void TCountryResource1::DeleteItem(TEndpointContext* AContext, TEndpointRequest* ARequest,
	TEndpointResponse* AResponse)
{
	String item;
	item = ARequest->Params->Values["item"];
	std::unique_ptr<TJSONObject> _return(new TJSONObject());
	std::unique_ptr<TFDQuery> LDelete(new TFDQuery(NULL));
	LDelete->Connection = EmployeeConnection;
	LDelete->SQL->Text = "delete from country where country = :country";
	LDelete->Params->ParamByName("country")->Value = item;
	try {
		LDelete->ExecSQL();
		_return->AddPair("coderror", new TJSONNumber(0));
	}
	catch(...) {
		AResponse->RaiseError(-100, "error", "Error borrando el registro");
	}
	AResponse->Body->SetValue(_return.release(), true);
}

static void Register()
{
       	std::auto_ptr<TEMSResourceAttributes> attributes(new TEMSResourceAttributes());
       	attributes->ResourceName = "Country";
       	attributes->ResourceSuffix["GetItem"] = "{item}";
       	attributes->ResourceSuffix["PutItem"] = "{item}";
       	attributes->ResourceSuffix["DeleteItem"] = "{item}";
       	RegisterResource(__typeinfo(TCountryResource1), attributes.release());
}

#pragma startup Register 32


