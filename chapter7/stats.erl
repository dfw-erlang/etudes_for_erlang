-module(stats).

-export([mean/1, stdv/1]).

mean(List) ->
  sum(List) / length(List).


stdv(List) ->
  Sum = sum(List),
  SumSquares = sum(lists:map(fun square/1, List)),
  Length = length(List),
  math:sqrt((Length * SumSquares - square(Sum))/(Length * (Length - 1))).

sum(List) ->
  lists:foldl(fun add/2, 0, List).

add(Adder, Addend) ->
  Adder + Addend.

square(X) ->
  X * X.
