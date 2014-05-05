/***************************************************************** 
This file contains some PROLOG examples which use the "!" operator
Some Cut Operator Resources:
 - http://en.wikibooks.org/wiki/Prolog/Cuts_and_Negation
 - http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse44
  
*****************************************************************/

% Returns the smallest number (X or Y) [Without the ! operator]
min(X, Y, X):- X<Y.
min(_, Y, Y).

% Returns the smallest number (X or Y) [With the ! operator]
minC(X, Y, X):- X<Y, !.
minC(_, Y, Y):- !.

% Joins two ordered lists into an ordered list (like in mergesort). This version perserves the repetitions
join([], L2, L2):- !.
join(L1, [], L1):- !.
join([P1|R1], [P2|R2], [P1|L]) :- P1 < P2, ! , join(R1, [P2|R2], L).
join([P1|R1], [P2|R2], [P2|L]) :- P1 >= P2, ! , join([P1|R1], R2, L).

% Joins two ordered lists into an ordered list (like in mergesort). This version removes the repetitions
joinNR([], L2, L2) :- !.
joinNR(L1, [], L1) :- !.
joinNR([P1|R1], [P2|R2], [P1|L]) :- P1 < P2, ! , joinNR(R1, [P2|R2], L).
joinNR([P1|R1], [P1|R2], [P1|L]) :- ! , joinNR(R1, R2, L). % element in both lists is the same
joinNR([P1|R1], [P2|R2], [P2|L]) :- P1 > P2, ! , joinNR([P1|R1], R2, L). % NOTE: P1 > P2 is not necessary here, it's just there for clarity

% separate(Numbers, Positive, Negative) separets the numbers from list Numbers into a list of Postive and Negative numbers. (NOTE: 0 is considered positive)
separate([], [], []) :- !.
separate([P|R], [P|Pos], Neg) :- P >= 0, !, separate(R, Pos, Neg).
separate([P|R], Pos, [P|Neg]) :- P < 0, ! , separate(R, Pos, Neg).

% An implementation of the IF A THEN B ELSE C conditional logic
ifThenElse1(A, B, _) :- A, !, B. % if A then B
ifThenElse1(_,_,_) :- C. % else C

ifThenElse2(A, B, C) :- A, ! , B ; C. % the "%" acts like an "OR"

% notEqual(A, B) evaluates true if A is different from B
notEqual1(A, B) :- A \= B.

notEqual2(A, B) :- not(A = B).

notEqual3(A, A) :- !, fail. % basically if both arguments are the same, fail 
notEqual3(_, _). % if it's something else, just unify
