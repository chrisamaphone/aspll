
% proof step indexed forward-chaining




 
% context(empty).
% context(cons(X, C))
%   :- prop(X), context(C).
 
prop(P) :- goal(P).

prop(A) :- prop(lolli(A, B)).
prop(B) :- prop(lolli(A, B)).

prop(A) :- prop(tensor(A, B)).
prop(B) :- prop(tensor(A, B)).

goal_t(G, 0)
  :- goal(G).

goal_ctx_t(D, 0)
  :- goal_ctx(D).

goal(lolli(tensor(a, b), tensor(b, a))).

goal_ctx(empty).
 
context(D) :- goal_ctx(D).

%  member_split(X, cons(X, D), empty, D)
%    :- prop(X), context(D).
%  
%  member_split(X, cons(Y, D), cons(Y, P))
%    :- member_split(X, D, P), X != Y, prop(Y).
%  
% equiv(empty, empty).
% equiv(cons(X, D), D') :- 
%   member_split(X, D', D''),
%   equiv(D, D'').
%    
%  
% splits(D, empty, D)
%   :- equiv(D, D).
% splits(cons(X, D), cons(X, D1), D2)
%   :- splits(D, D1, D2), prop(X).
% splits(X, Y, Z)
%   :- splits(X, Z, Y).
 
 
% %% Attempting to force termination
% 
% size(empty, 0).
% size(cons(X, Xs), S+1)
%   :- size(Xs, S), prop(X).
% 
% :- context(C), size(C, S), S > 10.
% 
% 
