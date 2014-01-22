-module(teeth).

-export([alert/1]).

alert(PocketDepths) ->
    alert(PocketDepths, 1, []).


alert([], _ToothNumber, SuspectTeeth) ->
    lists:reverse(SuspectTeeth);
alert([Head | RemainingPocketDepths], ToothNumber, SuspectTeeth) ->
    case lists:max(Head) >= 4 of
        true -> alert(RemainingPocketDepths, ToothNumber + 1, [ToothNumber | SuspectTeeth]);
        _else -> alert(RemainingPocketDepths, ToothNumber + 1, SuspectTeeth)
    end.
