% cap(r1,C1,E2,C2) tests if a queen placed on an 8x8 chess board
% at position (R1,C1) can capture another at position (R2,C2).
cap(Row, _, Row, _).                  % Note the use of the _ here
cap(_, Column, _, Column).            % and here, too.
cap(R1,C1,R2,C2) :- R1-C1 =:= R2-C2.
cap(R1,C1,R2,C2) :- R1+C1 =:= R2+C2.