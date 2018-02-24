player setCustomAimCoef 0.2;
player setUnitRecoilCoefficient 0.5;
player enableStamina FALSE;

player addEventHandler ['Respawn',{
    player setCustomAimCoef 0.2;
    player setUnitRecoilCoefficient 0.5;
    player enableStamina FALSE;

    player addAction ['Break Medikit', {
	    player removeItem "Medikit";
	    for ("_i") from 1 to 4 do { player addItem "firstAidKit"; };
	}, nil, 1.5, true, true, '', "'Medikit' in items _this"];
}];

player addAction ['Break Medikit', {
    player removeItem "Medikit";
    for ("_i") from 1 to 4 do { player addItem "firstAidKit"; };
}, nil, 1.5, true, true, '', "'Medikit' in items _this"];

_killPoints = player getVariable "killPoints";
if(isNil "_killPoints") then {
    _killPoints = 0;
};
player setVariable ["killPoints", _killPoints, true];


// Delete all map markers on clients
{
    _currMarker = toArray _x;
    if(count _currMarker >= 4) then {
        _currMarker resize 8; _currMarker = toString _currMarker;
        if(_currMarker == "bulwark_") then{ deleteMarker _x; };
    };
} foreach allMapMarkers;

if (didJIP) then {
  bullwarkBox addAction ["Pickup", "bulwark\moveBox.sqf"];
  bullwarkBox addAction ["Shop", "[] spawn bulwark_fnc_purchaseGui; ShopCaller = _this select 1"];
};
