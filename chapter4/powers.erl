-module(powers).

-export([raise/2]).

raise(_, 0) -> 1;

raise(X, N) when N > 0 ->
  raise(X, N, 1);

raise(X, N) when N < 0 -> 1 / raise(X, -N).

%Non-Exported functions
raise(_, 0, Accum) -> Accum;

raise(X, N, Accum) ->
  raise(X, N-1, X * Accum).
