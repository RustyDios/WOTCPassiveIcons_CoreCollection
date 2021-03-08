//*******************************************************************************************
//  FILE:   XComDownloadableContentInfo_WOTCPassiveIcons_CC.uc                                    
//  
//	File created by RustyDios	06/08/19	01:30	
//	LAST UPDATED				15/12/20	15:45
//
//	Clone of my Passive Icons mod created for the Core Collection, based on original work by ADVENT Avenger
//	PRETTY MUCH COMPLETELY REWRITTEN BY IRIDAR :)
//
//*******************************************************************************************

class X2DownloadableContentInfo_WOTCPassiveIcons_CC extends X2DownloadableContentInfo;

// Grab strings from the localisation files

/// Called on first time load game if not already installed	
static event OnLoadedSavedGame(){}								//empty_func
static event OnLoadedSavedGameToStrategy(){}					//empty_func

/// Called on new campaign while this DLC / Mod is installed
static event InstallNewCampaign(XComGameState StartState){}		//empty_func

//*******************************************************************************************
// ADD/CHANGES AFTER TEMPLATES LOAD ~ OPTC ~
//*******************************************************************************************

static event OnPostTemplatesCreated()
{
    local X2AbilityTemplateManager  AbilityMgr;
    local X2ItemTemplateManager     ItemMgr;
   
    AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
    ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

    //Additional Passives
    AddVaultPassiveToUnitsThatCanJump();
    AddPanicPassiveToRulers(AbilityMgr);
    AddBioPCSPassiveToBioPCS(AbilityMgr);

	//EnsurePassiveIconDisplay(X2AbilityTemplate, optional X2ItemTemplate, optional name, optional string, optional doner X2AbilityTemplate)

	//ruler panic localisation transfer
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('SerpentPanicPassive'),,,,AbilityMgr.FindAbilityTemplate('SerpentPanic'));
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('RagePanicPassive'),,,,AbilityMgr.FindAbilityTemplate('RagePanic'));
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('IcarusPanicPassive'),,,,AbilityMgr.FindAbilityTemplate('IcarusPanic'));

	//bio damage control localisation transfer
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('BioDamageControlPassive'),,,,AbilityMgr.FindAbilityTemplate('BioDamageControl'));

    //movement alterations
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('VaultAbilityPassive'),, 'eAbilitySource_Item', "UILibrary_DLC2Images.UIPerk_icarusvault");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('VaultAbility'),, 'eAbilitySource_Item', "UILibrary_DLC2Images.UIPerk_icarusvault");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('QueenArmorWallClimb'), ItemMgr.FindItemTemplate('QueenArmorClaws'), 'eAbilitySource_Item',"UILibrary_DLC2Images.UIPerk_icarusvault");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('WallPhasing'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_wraith");

    //base vests
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('StasisVestBonus'), ItemMgr.FindItemTemplate('StasisVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_nanofibervest");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('ScorchCircuits'),ItemMgr.FindItemTemplate('Hellweave'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_scorchcircuits");
        EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('ScorchCircuitsDamage'),ItemMgr.FindItemTemplate('Hellweave'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_scorchcircuits");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('HazmatVestBonus'), ItemMgr.FindItemTemplate('HazmatVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_flamesealant");

    //mod vests
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('StunDroneShield'), ItemMgr.FindItemTemplate('DroneVest_Xcom'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_nanofibervest");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('Ability_AshFlameScaleVest'), ItemMgr.FindItemTemplate('UtilityItem_AshFlameScaleVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_scorchcircuits");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('ValentinesVest_Bonus'), ItemMgr.FindItemTemplate('ValentinesVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_nanofibervest");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('AdventNanoScaleVestBonus'), ItemMgr.FindItemTemplate('BioNanoScaleVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_nanofibervest");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('BioViperScaleVestBonus'), ItemMgr.FindItemTemplate('BioViperScaleVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_nanofibervest");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('AdvancedBioViperScaleVestBonus'), ItemMgr.FindItemTemplate('AdvancedBioViperScaleVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_nanofibervest");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('AdventWraithVestBonus'), ItemMgr.FindItemTemplate('WraithVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_wraith");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('ViperFrostVestBonus'), ItemMgr.FindItemTemplate('FrostScaleVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_nanofibervest");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('MZIceVestStats'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_scorchcircuits");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('PsiVestBonus'),ItemMgr.FindItemTemplate('PsiVest'), 'eAbilitySource_Psionic',"UILibrary_PerkIcons.UIPerk_mentalfortress");

    //base items
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('MindShield'), ItemMgr.FindItemTemplate('MindShield'), 'eAbilitySource_Item',"UILibrary_XPACK_Common.PerkIcons.UIPerk_mindshield");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('MedikitBonus'), ItemMgr.FindItemTemplate('Medikit'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_immunities");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('NanoMedikitBonus'), ItemMgr.FindItemTemplate('NanoMedikit'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_immunities");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('RefractionFieldImmunities'),, 'eAbilitySource_Item',"UILibrary_XPACK_Common.PerkIcons.UIPerk_refractionfield", AbilityMgr.FindAbilityTemplate('RefractionFieldAbility'));
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('SustainingSphereAbility'), ItemMgr.FindItemTemplate('SustainingSphere'), 'eAbilitySource_Item');
        EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('SustainingSphereTriggeredAbility'), ItemMgr.FindItemTemplate('SustainingSphere'), 'eAbilitySource_Item');

    //mod items
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('AdvancedMindShieldBonus'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_mentalfortress");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('BioMedikitBonus'), ItemMgr.FindItemTemplate('BioMedikit'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_immunities");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('BioDamageControl'), ItemMgr.FindItemTemplate('PCSBioDamageControl'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_damage_control");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('SPARKShields'),, 'eAbilitySource_Commander',"UILibrary_PerkIcons.UIPerk_absorption_fields");
        EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('ShieldHardener'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_absorption_fields");
        EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('HardenerShield'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_absorption_fields");

    //other base icon swaps
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('SKULLMINEAbility'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_skulljack");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('MeleeResistance'),, 'eAbilitySource_Perk');
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('HolyWarriorMP'),, 'eAbilitySource_Psionic');
        EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('HolyWarriorM1'),, 'eAbilitySource_Psionic');
        EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('HolyWarriorM2'),, 'eAbilitySource_Psionic');
        EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('HolyWarriorM3'),, 'eAbilitySource_Psionic');

    //other mod icon swaps
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('SparkRegeneration'),, 'eAbilitySource_Commander',"UILibrary_XPACK_Common.PerkIcons.UIPerk_chosenrevive");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('WalkerServosJump'),ItemMgr.FindItemTemplate('WalkerServos'), 'eAbilitySource_Item',"UILibrary_DLC2Images.UIPerk_icarusvault");

	//The new immunity abilities: Chrm_AcidImmunity, Chrm_FireImmunity, Chrm_PoisonImmunity, Chrm_FrostImmunity, Chrm_MentalImmunity.
	//The new regen abilities: Chrm_RegenM1, Chrm_RegenM2, Chrm_RegenM3
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('Chrm_AcidImmunity'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_immunities");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('Chrm_FireImmunity'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_immunities");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('Chrm_PoisonImmunity'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_immunities");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('Chrm_FrostImmunity'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_immunities");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('Chrm_MentalImmunity'),, 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_immunities");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('Chrm_RegenM1'),, 'eAbilitySource_Item',"UILibrary_XPACK_Common.PerkIcons.UIPerk_chosenrevive");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('Chrm_RegenM2'),, 'eAbilitySource_Item',"UILibrary_XPACK_Common.PerkIcons.UIPerk_chosenrevive");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('Chrm_RegenM3'),, 'eAbilitySource_Item',"UILibrary_XPACK_Common.PerkIcons.UIPerk_chosenrevive");

    //LWotC ... does it's thing where it adds a whole new ability instead of patching the original ... so we need to look for those too ...
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('NanofiberVestBonus_LW'), ItemMgr.FindItemTemplate('NanofiberVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_nanofibervest");
    EnsurePassiveIconDisplay(AbilityMgr.FindAbilityTemplate('HazmatVestBonus_LW'), ItemMgr.FindItemTemplate('HazmatVest'), 'eAbilitySource_Item',"UILibrary_PerkIcons.UIPerk_item_flamesealant");

}

//*******************************************************************************************
//	HELPER FUNCTIONS
//*******************************************************************************************

// SetDisplayInfo(EPerkBuffCategory BuffCat, string strName, string strDesc, string strIconLabel, optional bool DisplayInUI=true, optional string strStatusIcon = "", optional Name opAbilitySource = 'eAbilitySource_Standard')

// eAbility/ePerkBuff colours				ePerkBuffCategories
// eAbilitySource_Passive	= Blue			ePerkBuff_Passive	Lower Left Corner
// eAbilitySource_Item		= Blue		
// eAbilitySource_Perk		= Yellow
// eAbilitySource_Standard	= Yellow		
// eAbilitySource_Psionic	= Purple
// eAbilitySource_Commander = Green			ePerkBuff_Bonus		^ green in mini-pop out
// eAbilitySource_Debuff	= Red			ePerkBuff_Penalty	v red in mini-pop out

static private function EnsurePassiveIconDisplay(X2AbilityTemplate Template, optional X2ItemTemplate ItemTemplate, optional name OverrideAbilitySourceName, optional string OverrideIconImage, optional X2AbilityTemplate DonorTemplate)
{
    local X2Effect_Persistent   PersistentEffect;
    local X2Effect              Effect;
 
    if (Template == none)
        return;
 
    if (OverrideAbilitySourceName != '')
    {
        Template.AbilitySourceName = OverrideAbilitySourceName;
    }
 
    if (OverrideIconImage != "")
    {
        Template.IconImage = "img:///" $ OverrideIconImage;
    }
 
    if (Template.LocFriendlyName == "" && ItemTemplate != none)
    {
        Template.LocFriendlyName = ItemTemplate.FriendlyName;
        Template.LocHelpText = ItemTemplate.BriefSummary != "" ? ItemTemplate.BriefSummary : ItemTemplate.TacticalText;
        Template.LocLongDescription = Template.LocHelpText;
    }

	if (Template.LocFriendlyName == "" && DonorTemplate != none)
    {
        Template.LocFriendlyName = DonorTemplate.LocFriendlyName;
        Template.LocHelpText = DonorTemplate.LocHelpText;
        Template.LocLongDescription = DonorTemplate.LocLongDescription;
    }

    if (Template.LocLongDescription == "" && ItemTemplate != none)
    {
        Template.LocFriendlyName = ItemTemplate.FriendlyName;
        Template.LocHelpText = ItemTemplate.BriefSummary != "" ? ItemTemplate.BriefSummary : ItemTemplate.TacticalText;
        Template.LocLongDescription = Template.LocHelpText;
    }

	if (Template.LocLongDescription == "" && DonorTemplate != none)
    {
        Template.LocFriendlyName = DonorTemplate.LocFriendlyName;
        Template.LocHelpText = DonorTemplate.LocHelpText;
        Template.LocLongDescription = DonorTemplate.LocLongDescription;
    }

    //  Cycle through Persistent Effects on the ability, if any exist.
    foreach Template.AbilityTargetEffects(Effect)
    {
        PersistentEffect = X2Effect_Persistent(Effect);
 
        if (PersistentEffect != none)
        {
            //  Find the first effect that is configured to display a passive icon
            if (PersistentEffect.bDisplayInUI && PersistentEffect.BuffCategory == ePerkBuff_Passive)
            {
                //  Then reset it to our new options, and exit function.
                //PersistentEffect.AbilitySourceName = AbilitySource;
                PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
                return;
            }
        }
    }
 
    //  If we're still in the function, it means none of the ability's Persistent Effects are configured to show up.
    //  Use whatever Persistent Effect we last grabbed from the ability template and make it display a passive icon.
    if (PersistentEffect != none)
    {
        PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
    }
    else    //  There are no persistent effects on the ability at all, so we add one ourselves.
    {
        PersistentEffect = new class'X2Effect_Persistent';
        PersistentEffect.BuildPersistentEffect(1, true, false);
        PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
        Template.AddShooterEffect(PersistentEffect);
    }
}

static private function AddVaultPassiveToUnitsThatCanJump()
{
	local X2CharacterTemplateManager    CharMgr;
    local X2CharacterTemplate           CharTemplate;
    local X2DataTemplate                DataTemplate;

    CharMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();

    foreach CharMgr.IterateTemplates(DataTemplate, none)
    {
        CharTemplate = X2CharacterTemplate(DataTemplate);

        if (CharTemplate.bCanUse_eTraversal_JumpUp) 
        {   
            CharTemplate.Abilities.AddItem('VaultAbilityPassive');
        }
	}
}

static private function AddPanicPassiveToRulers(X2AbilityTemplateManager  AbilityMgr)
{
    local X2AbilityTemplate         Template;
    
    Template = AbilityMgr.FindAbilityTemplate('SerpentPanic');
	if (Template != none)
	{
        Template.AdditionalAbilities.AddItem('SerpentPanicPassive');
    }

    Template = AbilityMgr.FindAbilityTemplate('RagePanic');
	if (Template != none)
	{
        Template.AdditionalAbilities.AddItem('RagePanicPassive');
    }

    Template = AbilityMgr.FindAbilityTemplate('IcarusPanic');
	if (Template != none)
	{
        Template.AdditionalAbilities.AddItem('IcarusPanicPassive');
    }
}

static private function AddBioPCSPassiveToBioPCS(X2AbilityTemplateManager  AbilityMgr)
{
    local X2AbilityTemplate         Template;
    
    Template = AbilityMgr.FindAbilityTemplate('BioDamageControl');
	if (Template != none)
	{
        Template.AdditionalAbilities.AddItem('BioDamageControlPassive');
	}
}
