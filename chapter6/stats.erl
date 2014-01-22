-module(stats).

-export([minimum/1,
         maximum/1,
         range/1]).

minimum([Head | Rest]) ->
    minimum(Rest, Head).

maximum([Head | Rest]) ->
    maximum(Rest, Head).

range(Items) ->
  [minimum(Items), maximum(Items)].

% Private Implementation Functions
minimum([], CurrentMin) ->
    CurrentMin;
minimum([Head | Rest], CurrentMin)
        when Head < CurrentMin ->
    minimum(Rest, Head);
minimum([_ | Rest], CurrentMin) ->
    minimum(Rest, CurrentMin).

maximum([], CurrentMax) ->
    CurrentMax;
maximum([Head | Rest], CurrentMax)
        when Head > CurrentMax ->
    maximum(Rest, Head);
maximum([_ | Rest], CurrentMax) ->
    maximum(Rest, CurrentMax).
