-module(ask_area).

-export([char_to_shape/1, get_number/1]).

char_to_shape(Char) ->
  char_to_shape_imp(string:to_lower(Char)).

get_number(Prompt) ->
  Message = io_lib:format("Enter ~s > ", [Prompt]),
  Entry = io:get_line(Message),
  to_number(clean_input(Entry)).

%non-exported functions
char_to_shape_imp("r") -> rectangle;
char_to_shape_imp("t") -> triangle;
char_to_shape_imp("e") -> ellipse;
char_to_shape_imp(_) -> unknown.

to_number(Number) when is_list(Number) ->
  to_number(Number, string:to_float(Number)).

to_number(_Number, {Result, []}) -> Result;

to_number(Number, {error, no_float}) ->
  to_number(Number, string:to_integer(Number));

to_number(_Number, _Anything) -> 
  error.

clean_input(Input) -> 
  string:strip(Input, right, $\n).
