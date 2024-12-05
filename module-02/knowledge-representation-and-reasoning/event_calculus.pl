:- discontiguous initiates/3.
:- discontiguous terminates/3.


% HoldsAt Axioms
holdsAt( F, T ) :- happens( E, T1)
                    , ( T1 < T )
                    , initiates( E, F, T1 )
                    , \+ clipped(T1, F, T ).
holdsAt( F,  T ) :- initially(F)
                    , \+ clipped( 0, F, T ).

% Clipping axiom
clipped( T1, F, T2 ) :- happens(E, T)
                        , ( T1< T), (T < T2 )
                        , terminates(E, F, T).
%--------------------------------------------------------------------------


% The light on/off example
initially(light_off).

% Effects of the "push_button" event on the fluent light_on:
initiates(push_button, light_on, T) :- T1 is T-1, T1>=0, holdsAt(light_off, T1).
terminates(push_button, light_on, T) :- T1 is T-1, T1>=0, holdsAt(light_on, T1).

% Effects of the "push_button" event on the fluent light_off:
initiates(push_button, light_off, T) :- T1 is T-1, T1>=0, holdsAt(light_on, T1).
terminates(push_button, light_off, T) :- T1 is T-1, T1>=0, holdsAt(light_off, T1).

happens(push_button, 3).
happens(push_button, 5).
happens(push_button, 6).
happens(push_button, 8).
happens(push_button, 9).
