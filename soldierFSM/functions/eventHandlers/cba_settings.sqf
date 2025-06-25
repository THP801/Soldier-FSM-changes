#include "script_component.hpp"

[
    "SFSM_customEH_Timer",
    "SLIDER",
    ["Custom EH Timer", "Delay between enemy detection loops (seconds)"],
    "SFSM - AI Detection",
    [0.1, 10, 2, 1],
    1,
    {}
] call CBA_fnc_addSetting;
