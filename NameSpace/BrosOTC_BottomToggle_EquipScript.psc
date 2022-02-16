Scriptname BrosOTC_BottomToggle_EquipScript extends ObjectReference Const
{Attached to BrosOTC_ARMO_BottomToggleXXXXX Armors}

group Armors_BottomWithTorso
Armor Property BrosOTC_ARMO_BottomWithTorso_AthleticShorts Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_Boxers Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_BoSUnzipped Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_Jockstrap Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_Joggers Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_RadstagPants Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_SubmarinePants Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_Thong Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_Thong_DickOut Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_UtilityPants Auto Const
Armor Property BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped Auto Const
endGroup

group Armors_BottomWithoutTorso
Armor Property BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_Boxers Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_Jockstrap Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_Joggers Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_RadstagPants Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_Thong Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_UtilityPants Auto Const
Armor Property BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped Auto Const
endGroup

group Armors_BottomToggle
Armor Property BrosOTC_ARMO_BottomToggle_AthleticShorts Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_Boxers Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_Boxers_DickOut Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_BoSUnzipped Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_Jockstrap Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_Jockstrap_DickOut Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_Joggers Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_RadstagPants Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_SubmarinePants Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_Thong Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_Thong_DickOut Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_UtilityPants Auto Const
Armor Property BrosOTC_ARMO_BottomToggle_VaultSuitUnzipped Auto Const
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

group Armors_TopToggle
Armor Property BrosOTC_ARMO_TopToggle_Beater Auto Const
Armor Property BrosOTC_ARMO_TopToggle_BosUndershirt Auto Const
Armor Property BrosOTC_ARMO_TopToggle_SleevelessTee Auto Const
Armor Property BrosOTC_ARMO_TopToggle_Thermal Auto Const
Armor Property BrosOTC_ARMO_TopToggle_VaultSuitUndershirt Auto Const
endGroup

group Keywords
Keyword Property BrosOTC_KYWD_TopWithLegs Auto Const
Keyword Property BrosOTC_KYWD_TopWithoutLegs Auto Const
Keyword Property BrosOTC_KYWD_BottomWithTorso Auto Const
Keyword Property BrosOTC_KYWD_BottomWithoutTorso Auto Const
endGroup

;Armor Property BrosOTC_ARMO_BottomToggle_AthleticShorts Auto Const

Event OnEquipped(Actor akActor)																									; The Armor (this script is attached to) was equipped

	Armor SelfBase = (Self as ObjectReference).GetBaseObject() as Armor															; Form of this [BottomInv]
	
	If SelfBase == BrosOTC_ARMO_BottomToggle_AthleticShorts
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Boxers
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Boxers_DickOut
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_BoSUnzipped
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Jockstrap
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Jockstrap_DickOut
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)								; this scenario works for if akActor was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Joggers
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_RadstagPants
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_SubmarinePants
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Thong
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Thong_DickOut
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_UtilityPants
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_VaultSuitUnzipped
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)	; if true, player was wearing shirt and pants and therefore need to just replace those pants
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
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
			akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)								; this scenario works for if player was nude or if they were shirtless with a different pair of pants
		EndIf
	EndIf
	
EndEvent

Event OnUnequipped(Actor akActor)

	Armor SelfBase = (Self as ObjectReference).GetBaseObject() as Armor
	
	If SelfBase == BrosOTC_ARMO_BottomToggle_AthleticShorts
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Boxers
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Boxers_DickOut
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_BoSUnzipped
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Jockstrap
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Jockstrap_DickOut
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Joggers
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_RadstagPants
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_SubmarinePants
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Thong
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_Thong_DickOut
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_UtilityPants
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_BottomToggle_VaultSuitUnzipped
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
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
			akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
		EndIf
	EndIf
	
EndEvent