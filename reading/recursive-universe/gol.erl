-module(benway).
-export([go/1]).
-import(sets).
-import(dict).


neighbors(Cell) ->
  [X,Y] = Cell,
  
  [ [(Dx + X), (Dy + Y)] 
    ||
    Dx <- [-1,0,1],
    Dy <- if
       	    Dx == 0 -> [-1,1];
	    true    -> [-1,0,1]
	  end
  ].

step(Cells) ->
  sets:from_list([1,2,3]).  

go(Delay) -> 
  io:format("Benway: life and death as\n"),
  io:format("  performance art\n v 0.0.1\n"),
  io:format("-------------------------\n"),
  
  io:format("~w\n", [neighbors([1,0])]),
  io:format("~w\n", [step([1,0])]).
