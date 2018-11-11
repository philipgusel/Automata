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


-- Example 2: automata that checks if a word is a vector

states = [1,2,3,4,5]
endstates = [5]
s = 1

delta i s
        | i == 1 && s == "(" = 2
        | i == 2 && s == "-" = 3
        | i == 2 && s `element` ["0","1","2","3","4","5","6","7","8","9"] = 4
        | i == 3 && s `element` ["0","1","2","3","4","5","6","7","8","9"] = 4
        | i == 4 && s == ";" = 2
        | i == 4 && s `element` ["0","1","2","3","4","5","6","7","8","9"] = 4
        | i == 4 && s == ")" = 5
       
a = mkautomata states endstates s delta

--check if  (0;0;0) is valid notation for a vector
checkword a ["(","0",";","0",";","0",")"]

```
