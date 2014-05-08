/*
	This file contains some list predicates
*/

% member(X, L) checks if X is a member of list L
member(X, [X|_]). % X is head of the list 
member(X, [_|R]) :- member(X, R). 

%join(L1, L2, Z) affirms that Z is the result of joining list L1 with L2
join([], L, L).
join([P|R], L1, [P|L2]) :- join(R, L1, L2).

%invert(L1, L2) affirms that L2 is the result of inverting the list L2
invert([], []).
invert([P|R], I) :- invert(R, I1), join(I1, [P], I).
% uses the join predicate to add the head of the list L1(or part of it) to the list I(inverted L1)