-module(calculus).

-export([derivative/2]).

derivative(Fn, X) ->
    Delta = 1.0e-10,
    (Fn(X + Delta) - Fn(X)) / Delta.
