module Parse where

import Data.List
import Data.Char
import Data.Maybe

checkDigits :: String -> Bool
checkDigits []     = True
checkDigits (x:xs) =
    case isDigit x of
        True -> checkDigits xs
        False -> False

addMaybe :: String -> Maybe [Int] --Just [1,2,3,4,5] --Nothing
addMaybe xs = case checkDigits xs of
                True  -> Just (convertDigits xs)
                False -> Nothing

convertDigits :: String -> [Int]
convertDigits []     = []
convertDigits (x:xs) = digitToInt x : convertDigits xs

length_valid :: [Int] -> Bool
length_valid xs = (length xs >= 13) && (length xs <= 16)

last_Digit :: [Int] -> Int
last_Digit xs = last xs

take_remain :: [Int] -> [Int]
take_remain xs = init xs

double_odd_digit :: [Int] -> [Int]
double_odd_digit []     = []
double_odd_digit (x:xs) =
   case (length (x:xs)) `mod` 2 of
        0 -> x : double_odd_digit xs
        1 -> 2*x : double_odd_digit xs

parse_sum :: Int -> Int
parse_sum n =
     case n < 10 of
         True  -> n
         False -> n`div`10 + n `mod` 10
after_sum :: [Int] -> [Int]
after_sum []     = []
after_sum (x:xs) = parse_sum x : after_sum xs

multi_nine_and_sum :: [Int] -> Int
multi_nine_and_sum xs = 9 * (sum xs)

check_last :: Int -> Int -> Bool -- a is the last digit from very beginning of the card number
check_last a b = a == (b `mod` 10)

is_valid_card :: String -> Bool
is_valid_card xs = case length_valid $ take_just_list $ addMaybe xs of
                    True -> check_last (last_Digit $ convertDigits xs) (multi_nine_and_sum (after_sum (double_odd_digit $ take_remain $ convertDigits xs)))
                    False -> False


take_just_list :: Maybe [a] -> [a]
take_just_list Nothing = []
take_just_list xs      = fromJust xs
--after_sum :: [Int] -> [Int]
--after_sum [] = []
--after_sum (x:xs) = parse_sum x : after_sum xs


addJust :: [a] -> Maybe [a]
addJust [] = Just []
addJust (x:xs) = x : Just