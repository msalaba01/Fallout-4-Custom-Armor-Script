Scriptname BrosOTC_BottomToggle_EquipScript extends ObjectReference Const
{Attached to BrosOTC_ARMO_BottomToggleXXXXX Armors}

group Armor_Versions
Armor Property BrosOTC_ARMO_BottomWithTorso Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso Auto Const
Armor Property BrosOTC_ARMO_BottomToggle Auto Const
endGroup

group Armors_TopWithLegs
Armor Property BrosOTC_ARMO_TopWithLegs_Beater Auto Const
Armor Property BrosOTC_ARMO_TopWithLegs_BosUndershirt Auto Const
Armor Property BrosOTC_ARMO_TopWithLegs_SleevelessTee Auto Const
Armor Property BrosOTC_ARMO_TopWithLegs_Thermal Auto Const
Armor Property BrosOTC_ARMO_TopWithLegs_VaultSuitUndershirt Auto Const
endGroup

group Armors_TopWithoutLegs
Armor Property BrosOTC_ARMO_TopWithoutLegs_Beater Auto Const
Armor Property BrosOTC_ARMO_TopWithoutLegs_BosUndershirt Auto Const
Armor Property BrosOTC_ARMO_TopWithoutLegs_SleevelessTee Auto Const
Armor Property BrosOTC_ARMO_TopWithoutLegs_Thermal Auto Const
Armor Property BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt Auto Const
endGroup

group Keywords_General
Keyword Property BrosOTC_KYWD_TopWithLegs Auto Const
Keyword Property BrosOTC_KYWD_TopWithoutLegs Auto Const
Keyword Property BrosOTC_KYWD_BottomWithTorso Auto Const
Keyword Property BrosOTC_KYWD_BottomWithoutTorso Auto Const
endGroup

GlobalVariable Property BrosOTC_GLOB_UnequipBlocked Auto Const		; Don't forget to create the Global Variable and fill the script property

;Armor Property BrosOTC_ARMO_BottomToggle_AthleticShorts Auto Const

Event OnEquipped(Actor akActor)																									; The Armor (this script is attached to) was equipped

	BrosOTC_GLOB_UnequipBlocked.SetValueInt(1)
	; this unequip block prevents the OnUnequipped event from firing on a different BottomToggle form when unequipped by this form!
	Armor SelfBase = (Self as ObjectReference).GetBaseObject() as Armor															; Form of this [BottomInv]
	
	If SelfBase == BrosOTC_ARMO_BottomToggle
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso, abSilent = true)
		ElseIf akActor.WornHasKeyword(BrosOTC_KYWD_TopWithLegs)																; This is checking which shirt was already equipped and swaps it to the version with the legs zapped
			If akActor.IsEquipped(BrosOTC_ARMO_TopWithLegs_Beater) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithLegs_Beater, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_Beater, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithLegs_BoSUndershirt) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithLegs_BoSUndershirt, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_BoSUndershirt, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithLegs_SleevelessTee) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithLegs_SleevelessTee, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithLegs_Thermal) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithLegs_Thermal, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_Thermal, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithLegs_VaultSuitUndershirt) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithLegs_VaultSuitUndershirt, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	EndIf
	BrosOTC_GLOB_UnequipBlocked.SetValueInt(0)
	
EndEvent

Event OnUnequipped(Actor akActor)

	Armor SelfBase = (Self as ObjectReference).GetBaseObject() as Armor
	
	If BrosOTC_GLOB_UnequipBlocked.GetValueInt() == 0
		If SelfBase == BrosOTC_ARMO_BottomToggle
			If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso, abSilent = true)
				If akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_Beater) == 1
					akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Beater, abSilent = true)
					akActor.EquipItem(BrosOTC_ARMO_TopWithLegs_Beater, abSilent = true)
				ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_BoSUndershirt) == 1
					akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_BoSUndershirt, abSilent = true)
					akActor.EquipItem(BrosOTC_ARMO_TopWithLegs_BoSUndershirt, abSilent = true)
				ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee) == 1
					akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee, abSilent = true)
					akActor.EquipItem(BrosOTC_ARMO_TopWithLegs_SleevelessTee, abSilent = true)
				ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_Thermal) == 1
					akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Thermal, abSilent = true)
					akActor.EquipItem(BrosOTC_ARMO_TopWithLegs_Thermal, abSilent = true)
				ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt) == 1
					akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt, abSilent = true)
					akActor.EquipItem(BrosOTC_ARMO_TopWithLegs_VaultSuitUndershirt, abSilent = true)
				EndIf
			Else
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso, abSilent = true)
			EndIf
		EndIf
	EndIf
	
EndEvent