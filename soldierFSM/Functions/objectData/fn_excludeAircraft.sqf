// this excludes aircraft from soldierFSM
if (!isServer) exitWith {};

private _excluded = [];

private _exclude = {
    {
        if (_x isKindOf "Air" && {!(_x getVariable ["excluded_SFSM", false])}) then {
            _x setVariable ["excluded_SFSM", true, true];
            _excluded pushBack _x;
        };
    } forEach vehicles;
};

call _exclude;

[] spawn {
    while {true} do {
        sleep 10;
        call _exclude;
    };
};
