%Ryan Anderson, ra111
%F28PL Coursework, Prolog

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1   <--- Yes, so we know what question you think you are answering
%
% The complex numbers are explained here (and elsewhere):
%  http://www.mathsisfun.com/algebra/complex-number-multiply.html
% Represent a complex integer as a two-element list of integers, so [4,5] represents 4+5i.
% Write Prolog predicates
%  cadd/3
%  cmult/3
% representing complex integer addition and multiplication. Thus for instance,
%  cadd([X1,X2],[Y1,Y2],[Z1,Z2])
% succeeds if and only if Z1=X1+Y1 and Z2=X2+Y2.
% Note that complex number multiplication is not just like complex number addition.
% Check the link and read the definition.
%
%   <--- always have the question under your nose

%This takes and returns a tuple, and so does not meet the requirement of using lists - apologogies
cadd(c(X1,X2), c(Y1,Y2), c(Z1,Z2)) :-
    Z1 is X1 + Y1,  % Add the first value x to first value y
    Z2 is X2 + Y2.  % Add the second value x to second value y 
%   test(cadd) :-
%        cadd((3,2),(1,7),(4,9)).

%Following the rules of complex number multiplication, multiplies 2 tuples and returns a tuple
cmult(c(X1,Y1),c(X2,Y2),c(Z1,Z2)):-
    Z1 is X1*X2 - Y1*Y2, % Calculate first value in complex number 
    Z2 is X1*Y2 + X2*Y1. % Calculate second value in complex number
%   test(cmult) :-
%        cmult((3,2),(1,7),(-11,23)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2
%
% An integer sequence is a list of integers. Write a Prolog predicate
%  seqadd/3
% such that seqadd(X,Y,Z) succeeds when X and Y are lists of integers of the same length and
% Z is their sequence sum.

%Add two lists of integers together, Z is the resulting sum
seqadd([X],[Y],[Z]):- Z is X + Y.
seqadd([H1|T1],[H2|T2],[H3|Z]):- H3 is H1 + H2 , seqadd(T1,T2,Z).
%  test(seqadd) :-
%        seqadd([1,2,3],[1,2,3],[2,4,6]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 3
%
% 3a. Explain what backtracking has to do with Prolog. You might find this webpage helpful:
% https://www.doc.gold.ac.uk/~mas02gw/prolog_tutorial/prologpages/search.html
%
%
%    Backtracking is the process of prolog failing to satisfy or match a goal and so it backtracks
%    or goes back to the previous choice point to try a different path that may successfully satisfy the goal.
%    Prolog does this by searching in a tree like structure all the possible options 
%    to try and match the goal you have set, so for example prolog instantiates a variable but it does not
%    meet the goal and so prolog will back track up the tree to instantiate a different variable and so until
%    it has exhausted all options or matched to the goal.    
%
%
% 3b. What is Cut in prolog and what does it have to do with backtracking? Explain your answer by giving examples of Cut
% used in at least one prolog rule, and explain how it affects the execution/resolution process.
%
%
%   Cut is represented with the ! symbol and prevents backtracking meaning once a choice has been made to 
%   try and satisfy a goal, if it fails prolog is commited and cannot go back to try and find a new path
%   to try again, if prolog attempts to backtrack over a cut it will cause that goal to fail.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 4
%
% Write a database for a predicate cycleoflife/1 such that the query
%  cycleoflife(X)
% returns the instantiations
%  X = eat
%  X = sleep
%  X = code
%  X = eat
%  X = sleep
%  X = code
%  ...
% in an endless cycle.
% (This question has a beautiful and simple answer. If you find yourself writing lines and lines of
% complex code, there’s probably something amiss.)

% Repeats in an endless cycle
cycleoflife(eat). %First
cycleoflife(sleep). %Second
cycleoflife(code). %Third
cycleoflife(X) :- cycleoflife(X). %Repeated calls force backtracking to find match 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END ANSWER TO Question 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%