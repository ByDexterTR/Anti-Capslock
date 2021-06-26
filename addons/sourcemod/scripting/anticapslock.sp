#include <sourcemod>
#include <chat-processor>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Anti Capslock", 
	author = "ByDexter", 
	description = "", 
	version = "1.0", 
	url = "https://steamcommunity.com/id/ByDexterTR - ByDexter#5494"
};

ConVar g_cvarMinLength = null;

public void OnPluginStart()
{
	g_cvarMinLength = CreateConVar("gereken_kelime_sayi", "2", "Küçük yazmaya zorlaması için gerekli karakter sayısı.", _, true, 0.0);
	AutoExecConfig(true, "Anti-Capslock", "ByDexter");
}

public Action CP_OnChatMessage(int & author, ArrayList recipients, char[] flagstring, char[] name, char[] message, bool & processcolors, bool & removecolors)
{
	int kelime, uzunluk = strlen(message);
	for (int i = 0; i < uzunluk; i++)
	{
		if (message[i] >= 'A' && message[i] <= 'Z')
		{
			kelime++;
		}
		else if (message[i] >= 'a' && message[i] <= 'z')
		{
			kelime++;
		}
	}
	if (kelime >= g_cvarMinLength.IntValue)
	{
		for (int i = 0; i < uzunluk; i++)
		{
			if (message[i] >= 'A' && message[i] <= 'Z')
			{
				message[i] = CharToLower(message[i]);
			}
		}
		return Plugin_Changed;
	}
	return Plugin_Continue;
} 