-module(dates).

-export([julian/1]).

julian(Date) ->
    DaysPerMonth = [31, %Jan
                    28, %Feb
                    31, %Mar
                    30, %Apr
                    31, %May
                    30, %Jun
                    31, %Jul
                    31, %Aug
                    30, %Sep
                    31, %Oct
                    30, %Nov
                    31], %Dec
    [Year, Month, Day] = tokenize_date(Date),
    Days = julian(Year, Month, Day, DaysPerMonth, 0),
    LeapDays = case is_leap_year(Year) andalso Month > 2 of
                    true -> 1;
                    _else -> 0
               end,
    Days + LeapDays.

%Private function definitions
julian(_Year, _Month, _Day, [], TotalDays) ->
    TotalDays;
julian(_Year, 1, Day, _, TotalDays) ->
    TotalDays + Day;
julian(_Year, Month, Day, [DaysInMonth | RemainingDaysPerMonth], TotalDays) ->
    NewTotal = TotalDays + DaysInMonth,
    julian(_Year, Month - 1, Day, RemainingDaysPerMonth, NewTotal).


tokenize_date(Date) ->
  [Year, Month, Day] = string:tokens(Date, "-"),
  [list_to_integer(Year), list_to_integer(Month), list_to_integer(Day)].

is_leap_year(Year) ->
  (Year rem 4 == 0 andalso Year rem 100 /= 0)
  orelse (Year rem 400 == 0).
