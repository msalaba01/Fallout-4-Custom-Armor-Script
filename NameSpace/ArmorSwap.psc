;/	-----------------------------------------------
	NameSpace:ArmorSwap.psc - by msalaba
	===============================================
	Reusage Rights --------------------------------
	You are free to use this script or portions of it in your own mods, provided you give me credit in your description and maintain this section of comments in any released source code (which includes the Imported Script Credit section to give credit to anyone in the associated Import scripts below).
	
	Warning !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	Do not directly recompile this script for redistribution without first renaming it to avoid compatibility issues with the mod this came from.
	
	Imported Script Credits:
	N/A
	-----------------------------------------------
	
	IMPORTANT! Rename your copy of this script.  [Be sure to change this ScriptName line to match whatever you name your copy of the file.]
	Template by msalaba
	===============================================	/;

ScriptName NameSpace:ArmorSwap extends ObjectReference Const
{Attach to my custom armor forms}

;	NameSpace is the folder(s) from root - separate by colon, NameSpace:NameSpace:ScriptName
;	i.e. .\Fallout 4\Data\Scripts\Source\User\
;	change all NameSpace entries to the actual folder(s) where the script is located from the root folder!

;	Const scripts can NOT have states or non-const properties / vars!

;/	---------------------------------------------
	ScriptNotes:
	
	;	There's actually 6 different versions of armors, not 3:
	;	1. TopToggle - what the script is attached to, and OnEquipped, decides whether to Equip 2 or 3 below
	;	2. TopWithLegs - this is essentially a full body outfit, but is a shirt with a nude lower half. Only to be worn alone
	;	3. TopWithoutLegs - this is just the shirt mesh with the legs of the ref body zapped. It's meant to be wearable with ANY and ALL of bottoms. Always paired with BottomWithoutTorso. If worn alone, the players legs are invisible - which we want to avoid.
	;	4. BottomToggle - scripted, decides whether to Equip 5 or 6
	;	5. BottomWithTorso - pants mesh with a nude torso, basically a shirtless outfit meant to be worn alone
	;	6. BottomWithoutTorso - only the pants with the ref torso zapped. Paired with the TopWithoutLegs always, don't ever wear alone or invisible torso!
	
	;	This revision requires:
	;	1)	make sure the armor form has the same name between the with/without torso/legs versions
	;	2)	there is no need for the toggle version, this script will handle that
	;	3)	there is no omod handling in this script. if an armor/weapon form have multiple mods configuration templates, each newly spawned item will be different depending on the conditions
	
	Objective:
	
	1)	Automatically swap equipped armor forms as needed based on the armor equipped
	
	Todo:
	
	=============================================	/;

;/	---------------------------------------------
	Editor_Properties
	=============================================	/;

Group Editor_Properties
	ArmorDef[]	Property CustomArmorForms				Auto Const Mandatory
	{struct property linking the 2 armor types together
	* make sure to pair the proper forms together! *}
	
	Keyword Property FullTopKeyword					Auto Const Mandatory
	{add to all armor forms that have "naked" legs}
	Keyword Property TopOnlyKeyword					Auto Const Mandatory
	{add to all armor forms that have "zapped" legs}
	Keyword Property FullBottomKeyword				Auto Const Mandatory
	{add to all armor forms that have "naked" torso}
	Keyword Property BottomOnlyKeyword				Auto Const Mandatory
	{add to all armor forms that have "zapped" torso}
EndGroup

;/	---------------------------------------------
	Struct Definitions
	=============================================	/;

Struct ArmorDef
	Armor	FullArmor				= none
	{armor that uses torso and leg slots}
	Armor	ZappedVersion			= none
	{armor that removes the torso or legs from the TorsoAndLegs Armor Form}
EndStruct

;/	---------------------------------------------
	Events
	=============================================	/;

Event OnEquipped(Actor akActor)	; The Armor (this script is attached to) was equipped
	if ( ArmorSwapManager.bBlockEquipEvents )
		; we are purposely blocking this event
		return
	endif
	
	ArmorSwapManager.bBlockEquipEvents = true
	
	Armor BaseForm = Self.GetBaseObject() as Armor
	
	if ( akActor == none || BaseForm == none )
		; Debug.MessagBox("We are mising a ref in OnEquipped call! Actor: " + (((akActor == none) as bool) as string) + ", Self as Form: " + (((BaseForm == none) as bool) as string)
		NameSpace:ArmorSwapManager.msTrace("ArmorSwap.OnEquipped, we are missing actor or armor form! Actor: " + akActor + ", Form: " + BaseForm, 2)
		return
	endif
	
	int iIndex = CustomArmorForms.FindStruct("FullArmor", BaseForm)
	
	if ( iIndex > -1 )	; FindStruct will return -1 if object is not found in the array element searched (remember - arrays start at index 0)
		
		; equipped object is a FullArmor
		Self.HandleFullArmorEquipped(akActor, iIndex, BaseForm)
	else
		
		iIndex = CustomArmorForms.FindStruct("ZappedVersion", BaseForm)
		
		if ( iIndex > -1 )
			
			; equipped object is a TopOnly or BottomOnly type
			if ( BaseForm.HasKeyword(TopOnlyKeyword) )
				Self.HandleTopOnlyEquipped(akActor, iIndex, BaseForm)
			else
				Self.HandleBottomOnlyEquipped(akActor, iIndex, BaseForm)
			endif
		else
			NameSpace:ArmorSwapManager.msTrace("ArmorSwap.OnEquipped, Form: " + BaseForm + " was not found in our data structure, do nothing!", 1)
		endif
	endif
	
	bBlockEquipEvents = false
EndEvent

Event OnUnEquipped(Actor akActor)	; The Armor (this script is attached to) was equipped
	if ( ArmorSwapManager.bBlockEquipEvents )
		; we are purposely blocking this event
		return
	endif
	
	ArmorSwapManager.bBlockEquipEvents = true
	
	Armor BaseForm = Self.GetBaseObject() as Armor
	
	if ( akActor == none || BaseForm == none )
		; Debug.MessagBox("We are mising a ref in OnEquipped call! Actor: " + (((akActor == none) as bool) as string) + ", Self as Form: " + (((BaseForm == none) as bool) as string)
		NameSpace:ArmorSwapManager.msTrace("ArmorSwap.OnUnEquipped, we are missing actor or armor form! Actor: " + akActor + ", Form: " + BaseForm, 2)
		return
	endif
	
	int iIndex = CustomArmorForms.FindStruct("FullArmor", BaseForm)
	
	if ( iIndex > -1 )	; FindStruct will return -1 if object is not found in the array element searched (remember - arrays start at index 0)
		
		; equipped object is a FullArmor
		Self.HandleFullArmorUnEquipped(akActor, iIndex, BaseForm)
	else
		
		iIndex = CustomArmorForms.FindStruct("ZappedVersion", BaseForm)
		
		if ( iIndex > -1 )
			
			; equipped object is a TopOnly or BottomOnly type
			if ( BaseForm.HasKeyword(TopOnlyKeyword) )
				Self.HandleTopOnlyUnEquipped(akActor, iIndex, BaseForm)
			else
				Self.HandleBottomOnlyUnEquipped(akActor, iIndex, BaseForm)
			endif
		else
			NameSpace:ArmorSwapManager.msTrace("ArmorSwap.OnUnEquipped, Form: " + BaseForm + " was not found in our data structure, do nothing!", 1)
		endif
	endif
	
	ArmorSwapManager.bBlockEquipEvents = false
EndEvent

;/	---------------------------------------------
	Private Functions
	=============================================	/;

Function HandleFullArmorEquipped(Actor akActor, int aiIndex, Armor aBaseForm)
	; Game should have unequipped any top or bottom only armors that were previously equipped.
	; should we have to care about any unequipped TopOnly or BottomOnly armors?
	; handling will be needed if the dropped item requires a special form to be used

	; update our vars for next time
	ArmorSwapManager.SetCurrentEquippedArmor(aCurrentEquippedFullArmor = aBaseForm, aCurrentEquippedTopOnly = none, aCurrentEquippedBottomOnly = none)
EndFunction

Function HandleTopOnlyEquipped(Actor akActor, int aiIndex, Armor aBaseForm)
	; check for previously equipped armor - we don't care about previously equipped TopOnly armors
	
	Armor[] CurrentEquippedArmor = ArmorSwapManager.GetCurrentEquippedArmor()
	; 0 - CurrentEquippedFullArmor
	; 1 - CurrentEquippedTopOnly
	; 2 - CurrentEquippedBottomOnly
	
	Armor EquippedFullArmor		= none
	Armor EquippedTopOnly 		= aBaseForm
	Armor EquippedBottomOnly 	= CurrentEquippedArmor[2]
	
	; check for FullArmor - remove from inventory as they were force unequipped
	if ( CurrentEquippedArmor[0] != none )
		; went from a FullArmor to a TopOnly - add the bottom if applicable
		int iIndex = CustomArmorForms.FindStruct("FullArmor", CurrentEquippedArmor[0])
		
		if ( iIndex > -1 && CustomArmorForms[iIndex].ZappedVersion.HasKeyword(BottomOnlyKeyword) )
			; currently equipped FullArmor has a bottom we can equip!
			EquippedBottomOnly = CustomArmorForms[iIndex].ZappedVersion
			; remove the old version and add & equip the new one
			akActor.RemoveItem(CurrentEquippedArmor[0], 1, abSilent = true)
			akActor.AddItem(EquippedBottomOnly, 1, abSilent = true)
			akActor.EquipItem(EquippedBottomOnly, abPreventRemoval = false, abSilent = true)
		
		; failsafe
		elseif ( EquippedBottomOnly == none || ! EquippedBottomOnly.HasKeyword(BottomOnlyKeyword) )
			; we do not have a BottomOnly version defined and one is not currently equipped! swap to FullArmor version
			NameSpace:ArmorSwapManager.msTrace("ArmorSwap.HandleTopOnlyEquipped, Form: " + aBaseForm + " was equipped and we do not have a TopOnly defined. switching to a FullArmor version!", 1)
			EquippedFullArmor = CustomArmorForms[aiIndex].FullArmor
			EquippedTopOnly = none
			akActor.UnEquipItem(aBaseForm, abPreventEquip = false, abSilent = true)
			akActor.RemoveItem(aBaseForm, 1, abSilent = true)
			
			if ( EquippedFullArmor != none )
				akActor.AddItem(EquippedFullArmor, 1, abSilent = true)
				akActor.EquipItem(EquippedFullArmor, abPreventRemoval = false, abSilent = true)
			else
				NameSpace:ArmorSwapManager.msTrace("ArmorSwap.HandleTopOnlyEquipped, Form: " + aBaseForm + " was equipped, a BottomOnly armor is not currently equipped and we do not have a FullArmor version defined at index: " + aiIndex + " we can equip! actor is currently naked!", 2)
			endif
		endif
	endif

	; update our vars for next time
	ArmorSwapManager.SetCurrentEquippedArmor(aCurrentEquippedFullArmor = EquippedFullArmor, aCurrentEquippedTopOnly = EquippedTopOnly, aCurrentEquippedBottomOnly = EquippedBottomOnly)
EndFunction

Function HandleBottomOnlyEquipped(Actor akActor, int aiIndex, Armor aBaseForm)
	; check for previously equipped armor - we don't care about previously equipped BottomOnly armors
	
	Armor[] CurrentEquippedArmor = ArmorSwapManager.GetCurrentEquippedArmor()
	; 0 - CurrentEquippedFullArmor
	; 1 - CurrentEquippedTopOnly
	; 2 - CurrentEquippedBottomOnly
	
	Armor EquippedFullArmor		= none
	Armor EquippedTopOnly 		= CurrentEquippedArmor[1]
	Armor EquippedBottomOnly 	= aBaseForm
	
	; check for FullArmor - remove from inventory as they were force unequipped
	if ( CurrentEquippedArmor[0] != none )
		; went from a FullArmor to a BottomOnly - add the top if applicable
		int iIndex = CustomArmorForms.FindStruct("FullArmor", CurrentEquippedArmor[0])
		
		if ( iIndex > -1 && CustomArmorForms[iIndex].ZappedVersion.HasKeyword(TopOnlyKeyword) )
			; currently equipped FullArmor has a top we can equip!
			EquippedTopOnly = CustomArmorForms[iIndex].ZappedVersion
			; remove the old version and add & equip the new one
			akActor.RemoveItem(CurrentEquippedArmor[0], 1, abSilent = true)
			akActor.AddItem(EquippedTopOnly, 1, abSilent = true)
			akActor.EquipItem(EquippedTopOnly, abPreventRemoval = false, abSilent = true)
		
		; failsafe
		elseif ( EquippedTopOnly == none || ! EquippedTopOnly.HasKeyword(TopOnlyKeyword) )
			; we do not have a TopOnly version defined and one is not currently equipped! swap to FullArmor version
			NameSpace:ArmorSwapManager.msTrace("ArmorSwap.HandleBottomOnlyEquipped, Form: " + aBaseForm + " was equipped and we do not have a BottomOnly defined. switching to a FullArmor version!", 1)
			EquippedFullArmor = CustomArmorForms[aiIndex].FullArmor
			EquippedBottomOnly = none
			akActor.UnEquipItem(aBaseForm, abPreventEquip = false, abSilent = true)
			akActor.RemoveItem(aBaseForm, 1, abSilent = true)
			
			if ( EquippedFullArmor != none )
				akActor.AddItem(EquippedFullArmor, 1, abSilent = true)
				akActor.EquipItem(EquippedFullArmor, abPreventRemoval = false, abSilent = true)
			else
				NameSpace:ArmorSwapManager.msTrace("ArmorSwap.HandleBottomOnlyEquipped, Form: " + aBaseForm + " was equipped, a BottomOnly armor is not currently equipped and we do not have a FullArmor version defined at index: " + aiIndex + " we can equip! actor is currently naked!", 2)
			endif
		endif
	endif

	; update our vars for next time
	ArmorSwapManager.SetCurrentEquippedArmor(aCurrentEquippedFullArmor = EquippedFullArmor, aCurrentEquippedTopOnly = EquippedTopOnly, aCurrentEquippedBottomOnly = EquippedBottomOnly)
EndFunction

Function HandleFullArmorUnEquipped(Actor akActor, int aiIndex, Armor aBaseForm)
	; update our vars for next time
	ArmorSwapManager.SetCurrentEquippedArmor(aCurrentEquippedFullArmor = none, aCurrentEquippedTopOnly = none, aCurrentEquippedBottomOnly = none)
EndFunction

Function HandleTopOnlyUnEquipped(Actor akActor, int aiIndex, Armor aBaseForm)
	Armor[] CurrentEquippedArmor = ArmorSwapManager.GetCurrentEquippedArmor()
	; 0 - CurrentEquippedFullArmor
	; 1 - CurrentEquippedTopOnly
	; 2 - CurrentEquippedBottomOnly
	
	Armor EquippedFullArmor		= CurrentEquippedArmor[0]
	Armor EquippedTopOnly 		= none
	Armor EquippedBottomOnly 	= CurrentEquippedArmor[2]
	
	if ( EquippedBottomOnly != none )
		; swap BottomOnly for FullArmor version
		int iIndex = CustomArmorForms.FindStruct("ZappedVersion", EquippedBottomOnly)
		
		if ( iIndex > 0 )
			EquippedFullArmor = CustomArmorForms[iIndex].FullArmor
			EquippedBottomOnly = none
			
			if ( EquippedFullArmor != none )
				akActor.RemoveItem(aBaseForm, 1, abSilent = true)
				akActor.AddItem(EquippedFullArmor, 1, abSilent = true)
				akActor.EquipItem(EquippedFullArmor, abPreventRemoval = false, abSilent = true)
			else
				NameSpace:ArmorSwapManager.msTrace("ArmorSwap.HandleTopOnlyUnEquipped, Form: " + aBaseForm + " was equipped, a BottomOnly armor currently equipped " + CurrentEquippedArmor[2] + " does not have a FullArmor version defined at index: " + iIndex + " we can equip! actor is currently naked!", 2)
			endif
		endif
	endif
	
	; update our vars for next time
	ArmorSwapManager.SetCurrentEquippedArmor(aCurrentEquippedFullArmor = EquippedFullArmor, aCurrentEquippedTopOnly = EquippedTopOnly, aCurrentEquippedBottomOnly = EquippedBottomOnly)
EndFunction

Function HandleBottomOnlyUnEquipped(Actor akActor, int aiIndex, Armor aBaseForm)
	Armor[] CurrentEquippedArmor = ArmorSwapManager.GetCurrentEquippedArmor()
	; 0 - CurrentEquippedFullArmor
	; 1 - CurrentEquippedTopOnly
	; 2 - CurrentEquippedBottomOnly
	
	Armor EquippedFullArmor		= CurrentEquippedArmor[0]
	Armor EquippedTopOnly 		= CurrentEquippedArmor[1]
	Armor EquippedBottomOnly 	= none
	
	if ( EquippedTopOnly != none )
		; swap TopOnly for FullArmor version
		int iIndex = CustomArmorForms.FindStruct("ZappedVersion", EquippedTopOnly)
		
		if ( iIndex > 0 )
			EquippedFullArmor = CustomArmorForms[iIndex].FullArmor
			EquippedTopOnly = none
			
			if ( EquippedFullArmor != none )
				akActor.RemoveItem(aBaseForm, 1, abSilent = true)
				akActor.AddItem(EquippedFullArmor, 1, abSilent = true)
				akActor.EquipItem(EquippedFullArmor, abPreventRemoval = false, abSilent = true)
			else
				NameSpace:ArmorSwapManager.msTrace("ArmorSwap.HandleTopOnlyUnEquipped, Form: " + aBaseForm + " was equipped, a BottomOnly armor currently equipped " + CurrentEquippedArmor[2] + " does not have a FullArmor version defined at index: " + iIndex + " we can equip! actor is currently naked!", 2)
			endif
		endif
	endif
	
	; update our vars for next time
	ArmorSwapManager.SetCurrentEquippedArmor(aCurrentEquippedFullArmor = EquippedFullArmor, aCurrentEquippedTopOnly = EquippedTopOnly, aCurrentEquippedBottomOnly = EquippedBottomOnly)
EndFunction
