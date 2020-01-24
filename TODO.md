# Ruby Chess Program TODO / Planning

Implement PGN (Portable Game Notation) import first.  parse a sample PGN file
to have moves read into methods in the proper format

#move piece algorithm

pawn: input of the form e4
  -find the piece type that the move describes - nil for pawn
  -go through the legal moves of each piece of that type and see if one is
  available
  -if move is a pawn, just look at the columns to the left or right of the
  pawn in the case of capturing

  -go down column, find any pieces of that type
  -need each method

# Board Hash

OK so what does board hash look like?
  key for each square on chessboard :a1 to :h8
    each key needs to store the piece occupying it

    the piece belongs to piece class.  can pass this pointer to 
    new square when it moves. this allows you to track individual
    pieces (rank, kills, dlc armor, etc)

# move piece method

this will feel so good to refactor - probably with procs or exec
or something
