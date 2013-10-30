%%% Geometric functions
-module(geom).

-export([area/3]).

area(Shape, A, B) when A >= 0 andalso B >= 0 ->
  case Shape of
    rectangle -> A * B;
    triangle -> (A * B) / 2.0;
    ellipse -> math:pi() * A * B
  end.
