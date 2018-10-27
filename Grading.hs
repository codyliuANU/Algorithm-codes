module Grading where

import BST
type Name = String
type Program = String
type Subjects = [String]
type Mark = Double
data Student = Student Name Program Subjects
   deriving (Show)

data Grade = High_Distinction | Distinction | Credit | Pass | Fail

display_mark :: Mark -> Grade
display_mark n
 | n >= 0 && n < 50 = Fail
 | n >= 50 && n < 60 = Pass
 | n >= 60 && n < 70 = Distinction
 | n >= 80 && n <= 100 = High_Distinction
 | otherwise = error "Not a valid mark!"


split_list :: String -> [(String,String)]
split_list [] = []
split_list s = split_list' [("",s)]

split_list' :: [(String,String)] -> [(String,String)]
split_list' [] = []
split_list' [(a,"")] = [(a,"")]
split_list' (x:xs) = x : split_list' [(fst x ++ [head (snd x)], tail (snd x))]
