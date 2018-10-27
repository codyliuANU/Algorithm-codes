module Set where

fac :: Int -> Int
fac n
 | n == 0 = 1
 | n >  0 = n * fac (n-1)
 | otherwise = error "No negative number!"

f :: [Int] -> [Int]
f [] = []
f (x:xs) = fac x : f xs

g :: ()