//---------------------------------------------------------------------------

#ifndef ServerMethodsUnit1H
#define ServerMethodsUnit1H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <DataSnap.DSServer.hpp>
#include <Datasnap.DSProviderDataModuleAdapter.hpp>
#include <Data.DB.hpp>
#include <FireDAC.Comp.Client.hpp>
#include <FireDAC.Comp.DataSet.hpp>
#include <FireDAC.DApt.hpp>
#include <FireDAC.DApt.Intf.hpp>
#include <FireDAC.DatS.hpp>
#include <FireDAC.Phys.hpp>
#include <FireDAC.Phys.IB.hpp>
#include <FireDAC.Phys.IBDef.hpp>
#include <FireDAC.Phys.Intf.hpp>
#include <FireDAC.Stan.Async.hpp>
#include <FireDAC.Stan.Def.hpp>
#include <FireDAC.Stan.Error.hpp>
#include <FireDAC.Stan.Intf.hpp>
#include <FireDAC.Stan.Option.hpp>
#include <FireDAC.Stan.Param.hpp>
#include <FireDAC.Stan.Pool.hpp>
#include <FireDAC.UI.Intf.hpp>
#include <FireDAC.VCLUI.Wait.hpp>
#include <FireDAC.Comp.UI.hpp>
#include <FireDAC.ConsoleUI.Wait.hpp>
#include <memory>
#include <System.JSON.hpp>
//---------------------------------------------------------------------------
class DECLSPEC_DRTTI TServerMethods1 : public TDataModule
{
__published:	// IDE-managed Components
	TFDConnection *EmployeeConnection;
	TFDQuery *CountryTable;
	TFDGUIxWaitCursor *FDGUIxWaitCursor1;
private:	// User declarations
public:		// User declarations
	__fastcall TServerMethods1(TComponent* Owner);
	// GET Obtener todos los paises
	TJSONObject * __fastcall GetCountries(void);
	// GET Obtener un pais
	TJSONObject * __fastcall GetCountry(const String AValue);
	// POST Insertar un pais
	TJSONObject * __fastcall UpdateInsert(const TJSONObject * AValue);
	// PUT Actualizar un pais
	TJSONObject * __fastcall AcceptUpdate(const TJSONObject * AValue);
	// DELETE Eliminar un pais
  TJSONObject * __fastcall CancelDelete(const String AValue);
};
//---------------------------------------------------------------------------
extern PACKAGE TServerMethods1 *ServerMethods1;
//---------------------------------------------------------------------------
#endif

