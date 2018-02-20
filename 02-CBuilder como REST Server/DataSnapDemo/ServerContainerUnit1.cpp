//----------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
#include <stdio.h>
#include <memory>
#include <string>
#include "ServerMethodsUnit1.h"

#include "ServerContainerUnit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

//---------------------------------------------------------------------------
char const *sPortInUse = "- Error: Port already in use\n";
char const *sPortSet = "- Port set to %d\n";
char const *sPortNotSet = "- Port could not be set\n";
char const *sServerRunning = "- The Server is already running\n";
char const *sStartingServer = "- Starting Server\n";
char const *sServerIsRunning = "- Server Running\n";
char const *sStoppingServer = "- Stopping Server\n";
char const *sServerStopped = "- Server Stopped\n";
char const *sServerNotRunning = "- The Server is not running\n";
char const *sInvalidCommand = "- Error: Invalid Command\n";
char const *sIndyVersion = "- Indy Version: ";
char const *sActive = "- Active: ";
char const *sTCPIPPort = "- TCP/IP Port: ";
char const *sHTTPPort = "- HTTP Port: ";
char const *sHTTPSPort = "- HTTPS Port: ";
char const *sSessionID = "- Session ID CookieName: ";
char const *sCommands = "Enter a Command: \n"
	"   - \"start\" to start the server\n"
	"   - \"stop\" to stop the server\n"
	"   - \"set port -t\" to change the TCP/IP default port\n"
	"   - \"set port -h\" to change the HTTP default port\n"
	"   - \"set port -s\" to change the HTTPS default port\n"
	"   - \"status\" for Server status\n"
	"   - \"help\" to show commands\n"
	"   - \"exit\" to close the application\n";
char const *sArrow = "->";
char const *sCommandStart = "start";
char const *sCommandStop = "stop";
char const *sCommandStatus = "status";
char const *sCommandHelp = "help";
char const *sCommandSetTCPIPPort = "set port -t";
char const *sCommandSetHTTPPort = "set port -h";
char const *sCommandSetHTTPSPort = "set port -s";
char const *sCommandExit = "exit";

typedef enum {TCPIP, HTTP, HTTPS} TDSProtocol;
//---------------------------------------------------------------------------

TServerContainer1 *ServerContainer1;
TComponent *FModule;
TDSServer *FDSServer;

//---------------------------------------------------------------------------
__fastcall TServerContainer1::TServerContainer1(TComponent* Owner)
	: TDataModule(Owner)
{
	FDSServer = DSServer1;
}
//---------------------------------------------------------------------------
__fastcall TServerContainer1::~TServerContainer1(void)
{
	FDSServer = NULL;
}
//----------------------------------------------------------------------------
void __fastcall TServerContainer1::DSServerClass1GetClass(TDSServerClass *DSServerClass,
          TPersistentClass &PersistentClass)
{
	PersistentClass =  __classid(TServerMethods1);
}
//----------------------------------------------------------------------------

void writeCommands()
{
	printf(sCommands);
	printf(sArrow);
}

void startServer(std::unique_ptr<TServerContainer1>const& module)
{
	if (!module->DSServer1->Started) {
		try {
			module->DSServer1->Start();
		} catch (Exception &exception) {		
			printf(sPortInUse);		
		}
		
		if (module->DSServer1->Started) printf(sStartingServer);
	}
	else {
		printf(sServerRunning);
	}

	printf(sArrow);
}

void stopServer(std::unique_ptr<TServerContainer1>const& module)
{
	if (module->DSServer1->Started) {
		printf(sStoppingServer);
		module->DSServer1->Stop();
		printf(sServerStopped);
	}
	else {
		printf(sServerNotRunning);
	}

	printf(sArrow);
}

void setPort(std::unique_ptr<TServerContainer1>const& module, int port, TDSProtocol protocol)
{
	if (!module->DSServer1->Started) {	
		switch(protocol) {	
		
		
					
		}	
		printf(sPortSet, port);
	}
	else {
		printf(sServerRunning);
	}
	printf(sArrow);
}

void writeStatus(std::unique_ptr<TServerContainer1>const& module)
{
	printf("%s %s\n", sActive, (module->DSServer1->Started) ? "true" : "false");
    
	printf(sArrow);
}

TDSServer *DSServer(void)
{
	return FDSServer;
}

//---------------------------------------------------------------------------
static void createContainer()
{
	FModule = new TServerContainer1(NULL);
}
static void freeContainer()
{
	free(FModule);
}
#pragma startup createContainer 33
#pragma exit freeContainer 33

