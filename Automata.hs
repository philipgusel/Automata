module Automata where

element :: Eq a => a -> [a] -> Bool
element a [] = False
element a (x:xs)
        | x == a = True
        | otherwise = element a xs

subset :: Eq a => [a] -> [a] -> Bool
subset [] _ = True
subset (x:xs) a
        | x `element` a == True = subset xs a
        | otherwise = False

type Delta = (Integer -> String -> Integer)
type States = [Integer]
type Endstates = [Integer]
type Init = Integer

type Automata = (States,Endstates,Init,Delta)

mkautomata :: States -> Endstates -> Init -> Delta -> Maybe Automata
mkautomata s e i d = if (e `subset` s) && (i `element` s) then Just (s,e,i,d) else Nothing

checkword :: Maybe Automata -> [String] -> Bool
checkword (Just (s,e,i,d)) l  = checkwordrecur (s,e,i,d) l i
checkword Nothing _ = False

checkwordrecur :: Automata -> [String] -> Integer -> Bool
checkwordrecur (s,e,i,d) [] c 
        | c `element` e == True = True
        | otherwise = False
checkwordrecur (s,e,i,d) (x:xs) c = checkwordrecur (s,e,i,d) xs (d c x)


