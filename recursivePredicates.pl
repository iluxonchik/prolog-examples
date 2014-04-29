% Note about iterative versions: The program itself is recursive, however, the process is not.

% comp(L, C) returns true if the lenght of list L is C
% recursive version
comp([], 0) :- !. % if an empty list or C = 0 is reached, the choices below will be ignored
comp([_|R], C) :- comp(R, C1), C is C1+1.

% iterative version
compi([], 0) :- !. % if an empty list or C = 0 is reached, the choices below will be ignored
compi([_|R], C) :- C1 is C-1, compi(R,C1).

%another iterative version, this one can answer to objectives such as compi2(X, 3).
compi2(L, C) :- compi2(L, 0, C).
compi2([], C, C).
compi2([_|R], X1, C) :- X2 is X1 + 1, compi2(R, X2, C).


% sumList(Xs, S) returns true if S is the sum of elements from the list Xs
% recursive version
sumList([], 0) :- !.
sumList([P|R], S) :- sumList(R, S1), S is S1+P.

% iterative version
sumListi([], 0) :- !.
sumListi([P|R], S) :- S1 is S-P, sumListi(R, S1).

%another iterative version, this one can answer to objectives such as sumListi2(X, 3).
sumListi2(L, C) :- sumListi2(L, 0, C).
sumListi2([], C, C).
sumListi2([X|R], X1, C) :- X2 is X1 + X, sumListi2(R, X2, C).


% remove(Xs, Y, Ys) returns true if Ys is a list resulting from removing all ocurrences of X from the list Xs
remove([] , _ , []) :- !.
remove([Px|Rx], Px, Ys) :- remove(Rx, Px, Ys).
remove([Px|_], Px, [Px|_]) :- !, fail. % force a fail and make sure that Prolog doesn't try to unify with any other remove/2
remove([Px|Rx], E , [Px|Ry]) :- remove(Rx, E, Ry).
% that !, fail is necessary, since the element to remove happens to be present in both lists.

% alternate version of remove/2, exept this one doesn't use ! or fail/0.
remove2([], _ , []) :- !.
remove2([Px|Rx], Px, Ys) :- remove2(Rx, Px, Ys). 
remove2([Px|Rx], E, [Px|Ry]) :- E \= Px, remove2(Rx, E, Ry).
% it's necessary to ensure that E \= Px, otherwise stuff like remove2([a,b,c], a, [a,b,c]) would return true.

% printList(L) prints out every element of the list and an "End Of The List" at the end
printList([]) :- write('End Of List').
printList([P|R]) :- write(P), nl, printList(R).