-module(powers).

-export([raise/2, nth_root/2]).

raise(_, 0) -> 1;

raise(X, N) when N > 0 ->
  raise(X, N, 1);

raise(X, N) when N < 0 -> 1 / raise(X, -N).

nth_root(X, N) ->
  Approx = X / 2,
  nth_root(X, N, Approx).

%Non-Exported functions
raise(_, 0, Accum) -> Accum;

raise(X, N, Accum) ->
  raise(X, N-1, X * Accum).


% Helper with approximation for nth_root
nth_root(X, N, Approx) ->
  io:format("Current Approximation is ~p~n", [Approx]),
  F = raise(Approx, N) - X,
  Fprime = N * raise(Approx, N - 1),
  Next = Approx - F / Fprime,
  Change = Next - Approx,
  if
    abs(Change) < 1.0e-8 -> Next;
    true -> nth_root(X, N, Next)
  end.

