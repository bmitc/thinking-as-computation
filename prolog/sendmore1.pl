% solution(...) holds for a solution to SEND+MORE=MONEY.
solution(S,E,N,D,M,O,R,Y) :-
    uniq_digits(S,E,N,D,M,O,R,Y), S > 0, M > 0,
    %Y is (D+E) mod 10, C1 is (D+E) // 10,
    %E is (N+R+C1) mod 10, C10 is (N+R+C1) // 10,
    %N is (E+O+C10) mod 10, C100 is (E+O+C10) // 10,
    %O is (S+M+C100) mod 10, M is (S+M+C100) // 10.
    sum_and_carry(Y, C1, D+E),
    sum_and_carry(E, C10, N+R+C1),
    sum_and_carry(N, C100, E+O+C10),
    sum_and_carry(O, M, S+M+C100).

% Calculates the Sum and Carry of the given Expression
sum_and_carry(Sum, Carry, Expression) :-
    Sum is Expression mod 10, Carry is Expression // 10.

% uniq(...) holds if the arguments are all distinct digits.
uniq_digits(S,E,N,D,M,O,R,Y) :-
    dig(S), dig(E), dig(N), dig(D), dig(M), dig(O), dig(R), dig(Y),
    \+ S=E, \+ S=N, \+ S=D, \+ S=M, \+ S=O, \+ S=R, \+ S=Y,
    \+ E=N, \+ E=D, \+ E=M, \+ E=O, \+ E=R, \+ E=Y,
    \+ N=D, \+ N=M, \+ N=O, \+ N=R, \+ N=Y,
    \+ D=M, \+ D=O, \+ D=R, \+ D=Y,
    \+ M=O, \+ M=R, \+ M=Y,
    \+ O=R, \+ O=Y,
    \+ R=Y.

% The digits
dig(0). dig(1). dig(2). dig(3). dig(4).
dig(5). dig(6). dig(7). dig(8). dig(9).
