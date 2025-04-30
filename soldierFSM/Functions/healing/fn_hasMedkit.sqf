// Copyright: Erlend Kristensen(c) 2023, learnbymistake@gmail.com
// BSD 3-Clause License     
// Author:         Leo Hartgen (Tally-1)
// Author links:   
//              https://github.com/Tally-1, 
//              https://thehartgen.web.app/projects/, 
//              https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3

// Description:   Checks if a unit has a medical kit in their inventory.

params [
    "_man"// object(man)
]; 
private _hasKit = false;
private _inventory = items _man;

private _vanillaKits = [
    "FirstAidKit",
    "Medikit"
];

{
    if(_x in _inventory)exitWith{
        _hasKit = true;
    };
    
} forEach _vanillaKits;

if!(SFSM_aceLoaded)exitWith{_hasKit;};

_hasKit = false;

private _allKits = [
    "FirstAidKit",
    "Medikit",
    "vn_b_item_firstaidkit",
    "vn_o_item_firstaidkit",
    "PiR_bint",
    "vn_b_item_medikit_01",
    "ACE_fieldDressing",
    "ACE_packingBandage",
    "ACE_elasticBandage",
    "ACE_packingBandage",
    "ACE_fieldDressing",
    "ACE_quikclot",
    "ACE_epinephrine"
    "ACM_PressureBandage"
    "ACE_morphine"
    "ACE_tourniquet"
    "ACM_ChestSeal"
    "ACM_NPA"
    "ACM_ElasticWrap"
    "ACE_salineIV_250"
    "ACE_tourniquet"
    "ACE_splint"
    "ACM_ChestSeal"
    "ACM_NPA"
    "ACM_NCDKit"
    "ACM_SuctionBag"
    "ACM_IV_16g"
];

{
    if(_x in _inventory)exitWith{
        _hasKit = true;
    };
    
} forEach _allKits;

_hasKit;
