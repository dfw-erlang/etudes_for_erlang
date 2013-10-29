%%% Geometric functions
-module(geom).

-export([area/2]).

%% Function to calulate the area of a rectangle.
area(Width, Height) ->
  io:format("Calculating area of a rectangle of ~w x ~w~n", [Width, Height]),
  Width * Height. %How you calculate the area of a rectangle.
