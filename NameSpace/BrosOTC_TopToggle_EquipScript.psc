Scriptname BrosOTC_TopToggle_EquipScript extends ObjectReference Const
{Attached to BrosOTC_ARMO_TopToggleXXXXX Armors}

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

Event OnEquipped(Actor akActor)																									; The Armor (this script is attached to) was equipped

	Armor SelfBase = (Self as ObjectReference).GetBaseObject() as Armor															; Form of this [TopInv]
	
	If SelfBase == BrosOTC_ARMO_TopToggle_Beater
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			If akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_Thermal) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Thermal, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_Beater, abSilent = true)
		ElseIf akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithTorso)
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_Beater, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_TopWithLegs_Beater, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_TopToggle_BosUndershirt
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			If akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_Beater) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Beater, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_Thermal) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Thermal, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt, abSilent = true)
		ElseIf akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithTorso)
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_TopWithLegs_BosUndershirt, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_TopToggle_SleevelessTee
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			If akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_Beater) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Beater, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_Thermal) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Thermal, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee, abSilent = true)
		ElseIf akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithTorso)
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_TopWithLegs_SleevelessTee, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_TopToggle_Thermal
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			If akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_Beater) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Beater, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_Thermal, abSilent = true)
		ElseIf akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithTorso)
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_Thermal, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_TopWithLegs_Thermal, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_TopToggle_VaultSuitUndershirt
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			If akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_Beater) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Beater, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_TopWithoutLegs_Thermal) == 1
				akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Thermal, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt, abSilent = true)
		ElseIf akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithTorso)
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_AthleticShorts) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Boxers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Jockstrap) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Joggers) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_RadstagPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_SubmarinePants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Thong) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_UtilityPants) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped) == 1
				akActor.UnequipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
				akActor.EquipItem(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
			akActor.EquipItem(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt, abSilent = true)
		Else
			akActor.EquipItem(BrosOTC_ARMO_TopWithLegs_VaultSuitUndershirt, abSilent = true)
		EndIf
	EndIf
	
EndEvent

Event OnUnequipped(Actor akActor)

	Armor SelfBase = (Self as ObjectReference).GetBaseObject() as Armor
	
	If SelfBase == BrosOTC_ARMO_TopToggle_Beater
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Beater, abSilent = true)
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
		Else
			akActor.UnequipItem(BrosOTC_ARMO_TopWithLegs_Beater, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_TopToggle_BosUndershirt
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_BosUndershirt, abSilent = true)
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
		Else
			akActor.UnequipItem(BrosOTC_ARMO_TopWithLegs_BosUndershirt, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_TopToggle_SleevelessTee
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_SleevelessTee, abSilent = true)
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
		Else
			akActor.UnequipItem(BrosOTC_ARMO_TopWithLegs_SleevelessTee, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_TopToggle_Thermal
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_Thermal, abSilent = true)
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
		Else
			akActor.UnequipItem(BrosOTC_ARMO_TopWithLegs_Thermal, abSilent = true)
		EndIf
	ElseIf SelfBase == BrosOTC_ARMO_TopToggle_VaultSuitUndershirt
		If akActor.WornHasKeyword(BrosOTC_KYWD_BottomWithoutTorso) && akActor.WornHasKeyword(BrosOTC_KYWD_TopWithoutLegs)
			akActor.UnequipItem(BrosOTC_ARMO_TopWithoutLegs_VaultSuitUndershirt, abSilent = true)
			If akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_AthleticShorts) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_AthleticShorts, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_BoSUnzipped) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_BoSUnzipped, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Boxers_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Boxers_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Jockstrap_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Jockstrap_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Joggers) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Joggers, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_RadstagPants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_RadstagPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_SubmarinePants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_SubmarinePants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_Thong_DickOut) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_Thong_DickOut, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_UtilityPants) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_UtilityPants, abSilent = true)
			ElseIf akActor.IsEquipped(BrosOTC_ARMO_BottomWithoutTorso_VaultSuitUnzipped) == 1
				akActor.EquipItem(BrosOTC_ARMO_BottomWithTorso_VaultSuitUnzipped, abSilent = true)
			EndIf
		Else
			akActor.UnequipItem(BrosOTC_ARMO_TopWithLegs_VaultSuitUndershirt, abSilent = true)
		EndIf
	EndIf

EndEvent