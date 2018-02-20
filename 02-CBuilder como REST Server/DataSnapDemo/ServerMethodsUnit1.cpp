//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ServerMethodsUnit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
//---------------------------------------------------------------------------
__fastcall TServerMethods1::TServerMethods1(TComponent* Owner)
	: TDataModule(Owner)
{
}
//----------------------------------------------------------------------------
// GET Obtener todos los paises
TJSONObject * __fastcall TServerMethods1::GetCountries(void){
	std::unique_ptr<TJSONObject> _return(new TJSONObject());
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
	_return->AddPair("coderror", new TJSONNumber(0));
	_return->AddPair("data", LRows.release());
	return _return.release();
}
//----------------------------------------------------------------------------
// GET Obtener un pais
TJSONObject * __fastcall TServerMethods1::GetCountry(const String AValue)
{
	std::unique_ptr<TJSONObject> _return(new TJSONObject());
	std::unique_ptr<TFDQuery> LQry(new TFDQuery(NULL));
	LQry->Connection = EmployeeConnection;
	LQry->SQL->Text = "select currency from country where country = :country";
	LQry->Params->ParamByName("country")->Value = AValue;
	LQry->Active = true;
	if(!LQry->Eof) {
		TJSONObject * LRow = new TJSONObject();
		LRow->AddPair("country", AValue);
		LRow->AddPair("currency", LQry->FieldByName("currency")->AsString);
		// Armar el JSON de retorno
		_return->AddPair("coderror", new TJSONNumber(0));
		_return->AddPair("data", LRow);
	}
	else {
		_return->AddPair("coderror", new TJSONNumber(-1));
		_return->AddPair("message", "Registro no encontrado");
	}
	LQry->Active = false;
	return _return.release();
}
//----------------------------------------------------------------------------
// POST Insertar un pais
TJSONObject * __fastcall TServerMethods1::UpdateInsert(const TJSONObject * AValue)
{
  std::unique_ptr<TJSONObject> _return(new TJSONObject());
	TJSONObject * ARequest = const_cast<TJSONObject*>(AValue);
	String LCountry(""), LCurrency("");
	if(ARequest->TryGetValue<String>("country", LCountry) &&
		ARequest->TryGetValue<String>("currency", LCurrency)) {
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
			_return->AddPair("coderror", new TJSONNumber(-1));
			_return->AddPair("message", "Error insertando el país");
		}
	}
	else {
		_return->AddPair("coderror", new TJSONNumber(-99));
		_return->AddPair("message", "JSON inválido, verifique los campos");
	}
	return _return.release();
}
//----------------------------------------------------------------------------
// PUT Actualizar un pais
TJSONObject * __fastcall TServerMethods1::AcceptUpdate(const TJSONObject * AValue)
{
  std::unique_ptr<TJSONObject> _return(new TJSONObject());
	TJSONObject * ARequest = const_cast<TJSONObject*>(AValue);
	String LCountry(""), LCurrency("");
	if(ARequest->TryGetValue<String>("country", LCountry) &&
		ARequest->TryGetValue<String>("currency", LCurrency)) {
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
			_return->AddPair("coderror", new TJSONNumber(-1));
			_return->AddPair("message", "Error actualizando el país");
		}
	}
  else {
		_return->AddPair("coderror", new TJSONNumber(-99));
		_return->AddPair("message", "JSON inválido, verifique los campos");
	}
	return _return.release();
}
//----------------------------------------------------------------------------
// DELETE Eliminar un pais
TJSONObject * __fastcall TServerMethods1::CancelDelete(const String AValue)
{
	std::unique_ptr<TJSONObject> _return(new TJSONObject());
	std::unique_ptr<TFDQuery> LInsert(new TFDQuery(NULL));
	LInsert->Connection = EmployeeConnection;
	LInsert->SQL->Text = "delete from country where country = :country";
	LInsert->Params->ParamByName("country")->Value = AValue;
	try {
		LInsert->ExecSQL();
		_return->AddPair("coderror", new TJSONNumber(0));
	}
	catch(...) {
		_return->AddPair("coderror", new TJSONNumber(-1));
		_return->AddPair("message", "Error actualizando el país");
	}
	return _return.release();
}
//----------------------------------------------------------------------------

