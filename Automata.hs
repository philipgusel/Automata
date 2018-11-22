module Automata where


type Delta = (Integer -> String -> Integer)
type Endstates = [Integer]
type Init = Integer

type Automata = (Endstates,Init,Delta)

element :: a -> [a] -> Bool
element _ [] = False
element a (x:xs)
	| x == a = True
	| otherwise = element a xs

checkword :: Automata -> [String] -> Bool
checkword (e,i,d) l  = checkwordrecur (e,i,d) l i

checkwordrecur :: Automata -> [String] -> Integer -> Bool
checkwordrecur (e,i,d) [] c 
        | c `element` e == True = True
        | otherwise = False
checkwordrecur (e,i,d) (x:xs) c = checkwordrecur (e,i,d) xs (d c x)




