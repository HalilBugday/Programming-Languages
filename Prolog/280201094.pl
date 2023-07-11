%consult("/Applications/SWI_Prolog/280201094.pl").
%:- consult('/Applications/SWI_Prolog/words.txt').
%grid([5,3,4,4,3], [[0,1,1,2],[0,3,2,1],[2,3,3,2],[3,3,4,0]], ReturnedList).



intersect(Word1, Index1, Word2, Index2) :-
    atom_chars(Word1, Chars1),
    atom_chars(Word2, Chars2),
    nth0(Index1, Chars1, Char),
    nth0(Index2, Chars2, Char).

generate_grid([], _, Grid, Grid). 
generate_grid([WordLength|RestLengths], Intersections, TempGrid, Grid) :-
    findall(Word, (word(Word), atom_length(Word, WordLength), \+member(Word, TempGrid)), Words),
    member(Word, Words),
    append(TempGrid, [Word], NewGrid),
    generate_grid(RestLengths, Intersections, NewGrid, Grid).

grid(WordLengths, Intersections, ReturnedList) :-
    length(WordLengths, NumWords),
    length(Intersections, NumIntersections),
    NumIntersections =:= NumWords - 1,

    generate_grid(WordLengths, Intersections, [], Grid),

    forall(member([WordIndex1, CharIndex1, WordIndex2, CharIndex2], Intersections),
           (nth0(WordIndex1, Grid, Word1),
            nth0(WordIndex2, Grid, Word2),
            intersect(Word1, CharIndex1, Word2, CharIndex2))),

    ReturnedList = Grid.

