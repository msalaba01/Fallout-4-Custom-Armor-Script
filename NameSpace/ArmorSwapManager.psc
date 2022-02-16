;/	-----------------------------------------------
	NameSpace:ArmorSwapManager.psc - by msalaba
	===============================================
	Reusage Rights --------------------------------
	You are free to use this script or portions of it in your own mods, provided you give me credit in your description and maintain this section of comments in any released source code (which includes the Imported Script Credit section to give credit to anyone in the associated Import scripts below).
	
	Warning !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	Do not directly recompile this script for redistribution without first renaming it to avoid compatibility issues with the mod this came from.
	
	Imported Script Credits:
	Kinggath for SS2 Functions this script calls
	-----------------------------------------------
	
	IMPORTANT! Rename your copy of this script.  [Be sure to change this ScriptName line to match whatever you name your copy of the file.]
	Template by msalaba
	===============================================	/;

ScriptName NameSpace:ArmorSwapManager extends Quest
{Attached to my mod controller Quest}

;	NameSpace is the folder(s) from root - separate by colon, NameSpace:NameSpace:ScriptName
;	i.e. .\Fallout 4\Data\Scripts\Source\User\
;	change all NameSpace entries to the actual folder(s) where the script is located from the root folder!

;	Const scripts can not have states or non-const properties / vars!

;/	---------------------------------------------
	ScriptNotes:
	
	A)	Important:
	
	1)		do not forget to fill out FormID in GetVersionMessage
	2)		do not forget to fill out plugin name in GetModForm
	3)		do not forget to fill out sLogName in GetLogFileName
	4)		do not forget to fill out sThisFullScriptName property for Canary support!
	
	B)		Optional Canary Support is built in
	
	Objective:
	
	Todo:
	
	=============================================	/;

;/	---------------------------------------------
	Editor_Properties
	=============================================	/;

Group Editor_Properties
	Actor 				Property PlayerRef 				Auto Const Mandatory
	{AutoFill Me}
	
	GlobalVariable		Property gESP_Version				Auto Const Mandatory
	{ * IMPORTANT * make sure our global has a unique EDID for each mod to avoid conflicts!
	* make sure global is const with an initial value >= 10000 *
	* this will be displayed as x.yy.zz in the version message *}
EndGroup

Group Mod_Startup_Items
	ItemList[]			Property GivePlayerItems			Auto Const
	{Optional - objects(s) to give PlayerRef on mod startup}
EndGroup

Group WorkshopMenuInjection
	WorkshopFramework:Library:DataStructures:WorkshopMenuInjection[] Property MyMenuInjections Auto Const
	{Optional - Add an entry for each vanilla workshop menu you'd like to inject to.
	* You do not need to enter sub-menus of your own menus here,
	since you can configure those custom formlists however you like. }
EndGroup

;/	---------------------------------------------
	Dynamic_Properties
	=============================================	/;

	int 	Property iSaveFileMonitor 					Auto Hidden	; Do not mess with ever - this is used by Canary to track data loss
	
	bool	Property bBlockEquipEvents					Auto Hidden	; used by ArmorSwap Script

;/	---------------------------------------------
	Vars
	=============================================	/;
	
	Armor	CurrentEquippedFullArmor					= none
	Armor	CurrentEquippedTopOnly						= none
	Armor	CurrentEquippedBottomOnly					= none

;/	---------------------------------------------
	Const Vars
	=============================================	/;

	int		iLastInstalledVersion						= 0
	
;/	---------------------------------------------
	Const Vars
	=============================================	/;
	
	String Property sThisFullScriptName = "NameSpace.ArmorSwapManager"			AutoReadOnly Hidden
	{ * The full script name including NameSpace. (this should be the same thing you put in the Scriptname line at the top of this script!) *
	i.e. \Fallout 4\Data\Scripts\Source\User\MyMod\ and you kept the script name the same, your full script name would be MyMod:CanarySaveFileMonitor }

	int 	iTimerID_CompleteStartup					= 101	Const
	int 	iTimerID_ShowVersionMessage					= 102	Const
	int		iTimerID_TryToInitQuest						= 103	Const

;/	---------------------------------------------
	Script_States
	---------------------------------------------	/;

Auto State NotStarted
	; this State prevents OnPlayerLoadGame from calling Startup
	
	Event Actor.OnPlayerLoadGame(Actor akSender)
		if ( OpenDebugLog() )
			msTrace("ArmorSwapManager.Actor.OnPlayerLoadGame, 'NotStarted' State, Game has Loaded, Debug Log has been opened")
		endif
		
		Self.TryToStartup()
	EndEvent

	Function HandleLocationChange()
		; waiting for the Player to enter an exterior cell (not PrewarWorldspace) before we complete quest startup
		Self.TryToStartup()
	EndFunction
EndState

;/	---------------------------------------------
	Events - Open State
	=============================================	/;

Event OnInit()
	if ( OpenDebugLog() )
		msTrace("ArmorSwapManager.OnInit, Quest initializing - Debug Log has been opened!")
	endif
EndEvent

Event OnQuestInit()
	; Run one-time initialization tasks
	Self.TryToInitQuest()
EndEvent

Event Actor.OnPlayerLoadGame(Actor akSender)
	Self.Startup()
EndEvent

Event OnPlayerTeleport()
	Self.HandleLocationChange()
EndEvent

Event OnQuestShutdown()
	; this quest has shut down - do any cleanup we need to do
	Self.HandleQuestShutdown()
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
	Self.HandleOnStageSet(auiStageID, auiItemID)
EndEvent

Event OnTimer(int aiTimerID)
	Self.HandleOnTimer(aiTimerID)
EndEvent

;/	---------------------------------------------
	Handler Functions
	=============================================	/;

Function HandleLocationChange()
EndFunction

Function HandleGameLoaded()
EndFunction

Function HandleOnStageSet(int auiStageID, int auiItemID)
EndFunction

Function HandleOnTimer(int aiTimerID)
	if ( aiTimerID == iTimerID_CompleteStartup )
		CompleteStartup()
	elseif ( aiTimerID == iTimerID_ShowVersionMessage )
		Self.ShowVersionMessage()
	elseif ( aiTimerID == iTimerID_TryToInitQuest )
		Self.TryToInitQuest()
	endif
EndFunction

Function HandleQuestShutdown()
EndFunction

Function HandleModUpdates()
EndFunction

;/	---------------------------------------------
	Public Functions
	=============================================	/;

Armor[] Function GetCurrentEquippedArmor()
	Armor[] returnForms = new Armor[3]
	returnForms[0] = CurrentEquippedFullArmor
	returnForms[1] = CurrentEquippedTopOnly
	returnForms[2] = CurrentEquippedBottomOnly
	return returnForms
EndFunction

Function SetCurrentEquippedArmor(Armor aCurrentEquippedFullArmor = none, Armor aCurrentEquippedTopOnly = none, Armor aCurrentEquippedBottomOnly = none)
	CurrentEquippedTopAndBottom = aCurrentEquippedFullArmor
	CurrentEquippedTopOnly		= aCurrentEquippedTopOnly
	CurrentEquippedBottomOnly	= aCurrentEquippedBottomOnly
EndFunction

;/	---------------------------------------------
	Private Functions
	=============================================	/;


Function UnRegisterOnPlayerTeleport()
	; wrapper so children can call - children do not get events registererd by Parent!
	Self.UnRegisterForPlayerTeleport()
EndFunction

Function UnRegisterOnPlayerLoadGame()
	; wrapper so children can call - children do not get events registererd by Parent!
	Self.UnregisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
EndFunction

Function Startup()
	; Do startup work here - called every time the player loads the game
	
	Self.HandleGameLoaded()
	Self.CheckForCanary()
	Self.CheckModVersion()
EndFunction

Function CheckForCanary()
	; check if Canary is installed, if true call MonitorForDataLoss
	if ( Game.IsPluginInstalled("CanarySaveFileMonitor.esl") )
		
		Var[] kArgs = new Var[2]
		kArgs[0] 	= Self as Quest
		kArgs[1] 	= sThisFullScriptName
		
		Utility.CallGlobalFunctionNoWait("Canary:API", "MonitorForDataLoss", kArgs)
	endif
EndFunction

Function TryToInitQuest()
	if ( PlayerRef == None )
		; WSFW Note - If a large number of quests are looking for PlayerRef, it can fail to populate, causing OnPlayerLoadGame to never register and we lose control of our updates
		Self.StartTimer(1.0, iTimerID_TryToInitQuest)	; this is better than calling Utility.Wait
	else
		Self.InitQuest()
	endif
EndFunction

Function InitQuest()
	; it is now ok to init quest
	Self.RegisterForEvents_OnInit()
	Self.TryToStartup()
	Self.CheckForCanary()	; do last
EndFunction

Function TryToStartup()
	Worldspace PlayerWorldspace = PlayerRef.GetWorldspace()
	Worldspace PrewarWorldspace = Game.GetFormFromFile(0x000A7FF4, "Fallout4.esm") as Worldspace	; We don't need a Property, only called Pre-War
	
	; this will delay Startup until the Player exits the Vault (or interior if using an alt start mod or loading mod into an existing save)
	if ! ( PlayerWorldspace != none && PlayerWorldspace != PrewarWorldspace && ! PlayerRef.IsInInterior() )
		return
	endif
	
	Self.GotoState("")
	Self.UnRegisterOnPlayerTeleport()
	Self.StartTimer(14.0, iTimerID_CompleteStartup)	; enough time to complete the vault exit elevator anim
EndFunction

; Player has left the Vault, or exited an interior cell after mod installed, complete startup
Function CompleteStartup()
	Self.Startup()
	Self.GiveInitialModStartupItems()
	; any other one time mod startup functions you want to happen after the player exits the vault or initial mod startup on existing game
EndFunction

Function RegisterForEvents_OnInit()
	Self.RegisterForRemoteEvent(PlayerRef, "OnPlayerLoadGame")
	Self.RegisterForPlayerTeleport()
EndFunction

Function CheckModVersion()
	
	if ( iLastInstalledVersion < gESP_Version.GetValue() )
		
		if ( iLastInstalledVersion > 0 )
			Self.HandleModUpdates()
		endif
		
		iLastInstalledVersion = gESP_Version.GetValue() as int
		Self.StartTimer(5.0, iTimerID_ShowVersionMessage)
	endif
EndFunction

Function ShowVersionMessage()
	; display a message to player with version number xxx.yy.zz
	Message mVersionMessage = Self.GetVersionMessage()
	
	if ( mVersionMessage == none )
		msTrace("MainQuest.ShowVersionMessage, Version Message Form not found! You most likely forgot to enter the FormID or plugin file name!", 2)
		return
	endif
	
	int[] iVersion = Self.GetVersionArray()
	mVersionMessage.Show(iVersion[0], iVersion[1], iVersion[2])
EndFunction

Message Function GetVersionMessage()
	return GetModForm(0x00000000) as Message
	
	;		enter the FormID in the get mod form call above - obmit the load order digits
	;		i.e. last 6 digits for normal esm / esp - last 3 digits for esl flagged
	
	; Note:
	;		Create a message and enter the following in the message body:
	;		MyModName v%.0f.%.0f.%.0f is installed
	
EndFunction

int[] Function GetVersionArray()
	; return version number xxx.yy.zz as array
	
	int[]	iVersion 		= new int[3]
	int 	iTempVersion 	= iLastInstalledVersion
	
	iVersion[0]		= 	(iTempVersion * 0.0001) as int
	iTempVersion	-= 	(iVersion[0] * 10000)
	iVersion[1]		= 	(iTempVersion * 0.01) as int
	iTempVersion	-= 	(iVersion[1] * 100)
	iVersion[2]		= 	iTempVersion
	
	return iVersion
EndFunction

; give mod startup items here
Function GiveInitialModStartupItems()
	if ( GivePlayerItems == none || GivePlayerItems.Length < 1 )
		return
	endif
	
	int i = GivePlayerItems.Length
	
	while ( i > 0 )
		
		i -= 1
		
		if ( GivePlayerItems[i].iQty > 0 )
			
			Form aGiveMe = GivePlayerItems[i].BaseForm
			
			if ( GivePlayerItems[i].BaseForm == none )
				if ( aGiveMe == none && GivePlayerItems[i].iFormID > 0 && GivePlayerItems[i].sModName != "" )
					aGiveMe = Game.GetFormFromFile(GivePlayerItems[i].iFormID, GivePlayerItems[i].sModName)
				endif
			endif
			
			if ( aGiveMe != none )
				PlayerRef.AddItem(aGiveMe, aiCount = GivePlayerItems[i].iQty, abSilent = GivePlayerItems[i].bAddSilent)
			endif
		endif
	endwhile
EndFunction

;/---------------------------------------------
	Get Methods:
=============================================/;
; functions we can call without having to type the plugin name each time and spell wrong!

Form Function GetFO4Form(int aiFormID) Global
	if ( aiFormID < 1 )
		; invalid!
		msTrace("MainQuest.GetFO4Form, we were sent an invalid FormID : " + aiFormID, 2)
		return none
	endif
	
	return Game.GetFormFromFile(aiFormID, "fallout4.esm")
EndFunction

Form Function GetModForm(int aiFormID) Global
	if ( aiFormID < 1 )
		; invalid!
		msTrace("MainQuest.GetModForm, we were sent an invalid FormID : " + aiFormID, 2)
		return none
	endif
	
	return Game.GetFormFromFile(aiFormID, "MS IsGoingToFail.esp")
EndFunction

Form Function GetSS2Form(int aiFormID) Global
	if ( aiFormID < 1 )
		; invalid!
		msTrace("MainQuest.GetSS2Form, we were sent an invalid FormID : " + aiFormID, 2)
		return none
	endif
	
	return Game.GetFormFromFile(aiFormID, "SS2.esm")
EndFunction

Form Function GetWSFWForm(int aiFormID) Global
	if ( aiFormID < 1 )
		; invalid!
		msTrace("MainQuest.GetWSFWForm, we were sent an invalid FormID : " + aiFormID, 2)
		return none
	endif
	
	return Game.GetFormFromFile(aiFormID, "WorkshopFramework.esm")
EndFunction

;/	---------------------------------------------
	Struct Definitions
=============================================	/;
	; this one is in our datastructures library, but the namespace will change mod to mod!
	
Struct ItemList
	bool	bAddSilent	= false
	{set true if you do not want the item added notification to display}
	int		iQty		= 1
	{amount of this item to give the player on mod start}
	Form	BaseForm	= none
	{object to give player - use either this OR iFormID and sModName}
	int		iFormID		= 0
	{FormID of the Form to give the player
	* use this and sModName or BaseForm *
	* Convert the last six hex digits of the FormID to decimal for this value *}
	string	sModName	= ""
	{full name of the mod including extention
	* use this and iFormID or BaseForm *}
EndStruct

;/---------------------------------------------
	ModUpdate_Functions
=============================================/;

;	example
;	Function UpdateToVersion_XXXXX()
;		; do stuff
;	EndFunction
	
;/---------------------------------------------
	Debug Code:	(fancy wrappers)
=============================================/;

string Function GetLogFileName() Global DebugOnly
	return "MS IsAMoronWhoFogotToNameThis"
EndFunction

bool Function OpenDebugLog()  Global DebugOnly
	return Debug.OpenUserLog(GetLogFileName())
EndFunction

Function CloseDebugLog()  Global DebugOnly
	Debug.CloseUserLog(GetLogFileName())
EndFunction

bool Function msTrace(string asTextToPrint = "string not sent!!!", int aiSeverity = 0, asLogName = "") Global DebugOnly
	string sLogName = asLogName
	
	if ( sLogName == "" )
		sLogName = GetLogFileName()
	endif
	
	string LogText
	
	if ( aiSeverity == 0 )
		LogText = "INFO >>>>> " + asTextToPrint
	elseif ( aiSeverity == 1 )
		LogText = "WARNING >> " + asTextToPrint
	elseif ( aiSeverity == 2 )
		LogText = "ERROR >>>> " + asTextToPrint
	else
		LogText = "No Data >> " + asTextToPrint
	endif
	
	return debug.TraceUser(sLogName, LogText, aiSeverity)
EndFunction
