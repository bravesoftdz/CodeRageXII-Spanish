//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "UFrmMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TForm6 *Form6;
//---------------------------------------------------------------------------
__fastcall TForm6::TForm6(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm6::Button1Click(TObject *Sender)
{
/*	Invocacion de DataSnap REST C++Builder
	RESTRequest1->Execute();
	if(RESTResponse1->JSONValue != NULL) {
		TJSONArray * LDSResult = static_cast<TJSONArray*>(
			static_cast<TJSONObject*>(RESTResponse1->JSONValue)->GetValue("result"));
		TJSONObject * LResult = static_cast<TJSONObject*>(LDSResult->Remove(0));
		if(LResult != NULL) {
			TJSONArray * LData = static_cast<TJSONArray*>(LResult->GetValue("data"));
			for(int i = 0; i < LData->Count; i++) {
				TJSONObject * LRow = static_cast<TJSONObject*>(LData->Items[i]);
				TListViewItem * item = ListView1->Items->Add();
				item->Text = LRow->GetValue("country")->Value();
				item->Detail = LRow->GetValue("currency")->Value();
			}
		}
	}
	*/
	RESTRequest2->Execute();
	if(RESTResponse2->JSONValue != NULL) {
		TJSONArray * LData = static_cast<TJSONArray*>(RESTResponse2->JSONValue);
		for(int i = 0; i < LData->Count; i++) {
			TJSONObject * LRow = static_cast<TJSONObject*>(LData->Items[i]);
			TListViewItem * item = ListView1->Items->Add();
			item->Text = LRow->GetValue("country")->Value();
			item->Detail = LRow->GetValue("currency")->Value();
		}
	}
}
//---------------------------------------------------------------------------
