%% Multiset rewriting

context(C)
  :- context_at(C, Time).

context_at(Delta', Time+1) :-
  transition(Rule, LHS, RHS),
  context_at(Delta, Time),
  subtract(Delta, LHS, Leftover),
  append(RHS, Leftover, Delta').

delete(cons(X, Delta), X, Delta) :-
  context(cons(X, Delta)).

delete(cons(Y, Delta), X, cons(Y, Delta')) :-
  delete(Delta, X, Delta'),
  context(cons(Y, Delta')).

subtract(Delta, empty, Delta) :- context(Delta).
subtract(Delta, cons(X, Xs), Delta'') :-
  subtract(Delta, Xs, Delta'),
  delete(Delta', X, Delta'').

append(X, empty, X) :- context(X).
append(Xs, cons(Y, Ys), cons(Y, Zs)) :-
  append(Xs, Ys, Zs),
  context(cons(Y, Ys)).

transition(r, cons(a, empty), cons(b, empty)). 
context_at(cons(a, empty), 0).
