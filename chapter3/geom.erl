%%% Geometric functions
-module(geom).

-export([area/1]).

area({Shape, Dimension1, Dimension2}) when Dimension1 > 0 andalso Dimension2 > 0 ->
  area(Shape, Dimension1, Dimension2);
area(_) ->
  io:format("Bro do you even geometry???!!!~n"),
  {error, bad_dimensions}.

%% Function to calulate the area of a rectangle.
area(rectangle, Width, Height) ->
  Width * Height; %How you calculate the area of a rectangle.
area(triangle, Base, Height)->
  Base * Height / 2.0;
area(ellipse, MajorRadius, MinorRadius) ->
  math:pi() * MajorRadius * MinorRadius;
area(_Shape, _, _) ->
  io:format("Bro do you even geometry???!!!~n"),
  {error, {unknown_shape, _Shape}}.
