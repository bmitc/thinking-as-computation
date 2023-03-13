:- [movies].

% Obtain one possible substitution ("Result") for Query
get_result(Query, Result) :-
    term_string(Term, Query, [variable_names(VariableNames)]),
    Term,
    Result = VariableNames.

% Find and print all substitutions for Query
log_query(Number, Query) :-
    format("~w) Evaluating: ~w~n", [Number, Query]),
    findall(Result, get_result(Query, Result), Results),
    writeln(Results),
    nl.

main :-
    log_query(1, "acted_in('Leonardo DiCaprio', 'Babel')"),
    log_query(2, "directed(Director, 'District 9')"),
    log_query(3, "acted_in(Actor, 'Click'), acted_in(Actor, 'The Aviator')."),
    log_query(4, "released(Movie, 2010), \\+ acted_in('Jennifer Aniston', Movie)."),
    log_query(5, "released(Movie, 2009), directed(Director, Movie)."),
    log_query(6, "directed(Director, Movie_1), directed(Director, Movie_2), \\+ Movie_1 = Movie_2."),
    log_query(7, "directed(Director_1, Movie), directed(Director_2, Movie), \\+ Director_1 = Director_2."),
    log_query(8, "")

:- initialization main.
