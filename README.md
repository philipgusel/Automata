# Automata
A library for simulating deterministic finite Automata in Haskell

Usage:

```haskell
-- Example: automata that determines if a binary number is divisible by 4
import Automata
-- a list of states
states = [1,2,3]
-- the initial state
init = 1
-- a list of end states
endstates = [3]
-- a function state -> string -> state to simulate a transition table
delta i s
        | i == 1 && s == "1" = 1
        | i == 1 && s == "0" = 2
        | i == 2 && s == "1" = 1
        | i == 2 && s == "0" = 3
        | i == 3 && s == "1" = 1
        | i == 3 && s == "0" = 3

-- function checking if the automata is valid
a = mkautomata states init endstates delta

-- check if 4 is in the language (is divisible by 4)
checkword a ["1","0","0"]

```
