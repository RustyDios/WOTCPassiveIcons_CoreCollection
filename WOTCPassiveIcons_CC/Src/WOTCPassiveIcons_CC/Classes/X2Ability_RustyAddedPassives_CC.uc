//*******************************************************************************************
//  FILE:   X2Ability_RustyAddedPassives_CC.uc                                    
//  
//	File created by RustyDios	27/10/19	20:30	
//	LAST UPDATED				19/07/20	20:00	
//
//	This file adds new pure passives for abilities that don't 'trigger' on tac map start 
//		or basically anything I couldn't get to work fully in OPTC
//	Adds passive ability icons for the ruler armours panic (and Bio 2.0 Damage PCS)
//
//*******************************************************************************************

class X2Ability_RustyAddedPassives_CC extends X2Ability;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(PurePassive('SerpentPanicPassive', "UILibrary_PerkIcons.UIPerk_mindmerge2", true, 'eAbilitySource_Item'));
	Templates.AddItem(PurePassive('RagePanicPassive', "UILibrary_PerkIcons.UIPerk_mindmerge2", true, 'eAbilitySource_Item'));
	Templates.AddItem(PurePassive('IcarusPanicPassive', "UILibrary_PerkIcons.UIPerk_mindmerge2", true, 'eAbilitySource_Item'));

	Templates.AddItem(PurePassive('BioDamageControlPassive', "img:///UILibrary_PerkIcons.UIPerk_damage_control", true, 'eAbilitySource_Item'));

	return Templates;
}	
