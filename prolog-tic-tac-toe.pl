state(x).
state(o).
state(" ").

loc(1).
loc(2).
loc(3).
loc(4).
loc(5).
loc(6).
loc(7).
loc(8).
loc(9).

:-dynamic(at/2).
at(" ", 1).
at(" ", 2).
at(" ", 3).
at(" ", 4).
at(" ", 5).
at(" ", 6).
at(" ", 7).
at(" ", 8).
at(" ", 9).

mark(A,B):-
    A \== state,
    B \== loc,
    retract(at(" ", B)),
    assert(at(A,B)),
    print_board(),
    check_winner(A).

check_winner(A):-
    get_winner(A),
    writeln(""),
    write("Player "),
    write(A),
    write(" is winning the game !").

get_winner(A):-
    at(A, 1), at(A, 2), at(A, 3);
    at(A, 4), at(A, 5), at(A, 6);
    at(A, 7), at(A, 8), at(A, 9);
    at(A, 1), at(A, 4), at(A, 7);
    at(A, 2), at(A, 5), at(A, 8);
    at(A, 3), at(A, 6), at(A, 9);
    at(A, 1), at(A, 5), at(A, 9);
    at(A, 3), at(A, 5), at(A, 7).

start:-
    writeln("Use mark(state, loc) to play the game"),
    writeln("Choose between x or o !"),
    writeln(""),
    writeln("loc Grid Guide :"),
    writeln(" 1 | 2 | 3"),
    writeln("---|---|---"),
    writeln(" 4 | 5 | 6"),
    writeln("---|---|---"),
    writeln(" 7 | 8 | 9").

get_state(X):-
    X \== loc,
    at(Y,X),
    write(Y). 

print_board():-
    write(" "),
    get_state(1),
    write(" | "),
    get_state(2),
    write(" | "),
    get_state(3),
    writeln(""),
    write("---|---|---"),
    writeln(""),
    write(" "),
    get_state(4),
    write(" | "),
    get_state(5),
    write(" | "),
    get_state(6),
    writeln(""),
    write("---|---|---"),
    writeln(""),
    write(" "),
    get_state(7),
    write(" | "),
    get_state(8),
    write(" | "),
    get_state(9).