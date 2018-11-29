module Automata where

element _ [] = False
element a (x:xs)
	| x == a = True
	| otherwise = element a xs

checkword (e,i,d) l  = checkwordrecur (e,i,d) l i

checkwordrecur (e,i,d) [] c 
        | c `element` e == True = True
        | otherwise = False
checkwordrecur (e,i,d) (x:xs) c = checkwordrecur (e,i,d) xs (d c x)
