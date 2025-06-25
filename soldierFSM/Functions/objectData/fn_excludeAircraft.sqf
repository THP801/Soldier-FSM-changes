if (!isServer) exitWith {};

// Use a namespace to avoid polluting global variables
missionNamespace setVariable ["SFSM_ExcludedVehicles", []];

// Function to exclude air vehicles
private _excludeAirVehicles = {
    private _excluded = missionNamespace getVariable ["SFSM_ExcludedVehicles", []];

    {
        if (_x isKindOf "Air" && {!(_x getVariable ["excluded_SFSM", false])}) then {
            _x setVariable ["excluded_SFSM", true, true];
            _excluded pushBackUnique _x;  // Ensures no duplicates
        };
    } forEach vehicles;

    missionNamespace setVariable ["SFSM_ExcludedVehicles", _excluded];
};

// Run once at start
call _excludeAirVehicles;

// Use CBA scheduled function for periodic checking (safer and cleaner)
["SFSM_ExcludeLoop", 10, {
    call _excludeAirVehicles;
}, [], true] call CBA_fnc_addPerFrameHandler;
