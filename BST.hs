module BST (
   Tree(Null, Node),
   size,
   depth,
   leaves,
   insert,
   treeContains,
   treeMax,
   treeMap,
   treeIsValid,
)where

import Seta

-- 5
--NUll   6
--      6.5   7
--         Null  Null
--Node 5 (Null (Node 6 NUll (Node 7 Null Null)))
-- 1   -- 2^0
-- 2   -- 2^1
-- 4   -- 2^2
-- 8    -- 2^3
-- 16    -- 2^4
--log_2 31 = 5
--O(log n)
-- 1 + max   0   depth (Node 6 NUll (Node 7 Null Null))
-- 1 + max  0   (1 + max (depth Null) (depth (NOde 7 NUll Null)))
-- 1 + max  0   (1 + max 0 (1 + max 0 0 ))
-- 1 + max  0   (1 + max 0 (1 + 0))
-- 1 + max  0   (1 + max 0 1)
-- 1 + max  0   (1 + 1)
-- 1 + max  0   2
-- 1 + 2 = 3
data Tree a = Null | Node a (Tree a) (Tree a)
     deriving (Show)

size :: Tree a -> Int
size Null = 0
size (Node v l r) = 1 + (size l) + (size r) -

depth :: Tree a -> Int
depth Null = 0
depth (Node v l r) = 1 + max (depth l) (depth r)

shortest_path :: Tree a -> Int
shortest_path Null = 0
shortest_path (Node v Null r) = 1
shortest_path (Node v l Null) = 1
shortest_path (Node v l r) = 1 + min (shortest_path l) (shortest_path r)

leaves :: Tree a -> [a]
leaves Null = []
leaves (Node v Null Null) = [v]
leaves (Node v l r) = leaves l ++ leaves r

flatten :: Tree a -> [a]
flatten Null = []
flatten (Node v l r) = flatten l ++ flatten r ++ [v]

insert :: (Ord a) => Tree a -> a -> Tree a
insert Null         v = Node v Null Null
insert (Node k l r) v
 | v == k = (Node k l r)
 | v < k  = Node k (insert l v) r
 | v > k  = Node k l            (insert r v)

treeContains :: (Ord a, Eq a) => Tree a -> a -> Bool
treeContains Null v = False
treeContains (Node k l r) v
 |v == k = True
 |v <  k = treeContains l v
 |v >  k = treeContains r v



treeMax :: (Ord a, Eq a) => Tree a -> a
treeMax Null = error "No element!"
treeMax (Node v Null Null) = v
treeMax (Node v Null r) = max v (treeMax r)
treeMax (Node v l Null) = max v (treeMax l)
treeMax (Node v l r) = max (treeMax l) (treeMax r)

treeMap :: (a -> b) -> Tree a -> Tree b
treeMap _ Null = Null
treeMap f (Node v l r) = Node (f v) (treeMap f l) (treeMap f r)
--f(x) = x + 1

val :: Tree a -> a
val (Node v l r)  = v

treeIsValid :: (Ord a) => Tree a -> Bool
treeIsValid Null = True
treeIsValid (Node v Null Null) = True
treeIsValid (Node v Null r) = if (val r) > v then treeIsValid r else False
treeIsValid (Node v l Null) = if (val l) < v then treeIsValid l else False
treeIsValid (Node v l r ) = if ((val l) < v) && ((val r) > v) then (treeIsValid l) && (treeIsValid r) else False

test :: (Num a) => Tree a
test = Node 8
           (Node 4
               (Node 5 Null Null)
               (Node 6
                      (Node 5 Null Null)
                      Null))
           (Node 10 Null Null)


filter' :: (a -> Bool) -> [a] -> [a]
filter' f [] = []
filter' f (x:xs) = if f x then x : filter' f xs else filter' f xs


maxi :: (Num a, Ord a, Eq a) => [a] -> a
maxi [] = error ""
maxi [x] = x
maxi (x:xs) = go x xs
     where
        go v []     = v
        go v (b:bs) = case v < b of
                       True -> go b bs
                       _    -> go v bs


compound :: Double -> Double -> Int -> [Double]
compound c _ 0 = [c]
compound c i k = c : compound (c*(1.0+i)) i (k-1)

quick_sort :: (Num a, Ord a) => [a] -> [a]
quick_sort [] = []
quick_sort (x:xs) = quick_sort [y | y <=  x , y <- xs] ++ [x] ++ quick_sort [y | y > x , y <- xs]
-- sort [4,5,1,3,2]
-- sort [1,3,2]  ++ [4] ++  sort [5]
-- (sort [] ++ [1] ++ sort [3,2]) ++ [4] ++ (sort [] ++ [5] ++ sort [])
-- ([] ++ [1] ++ (sort [2] ++[3] ++ sort [])) ++ [4] ++ ([] ++ [5] ++ [])
-- ([] ++ [1] ++ ([] ++ [2] ++ [] ++ [] ++ [3] ++ [] ++ [])) ++ [4] ++ ([] ++ [5] ++ [])
--x pivot
-- [1,2,3] 2 5 = [1,2,5]
-- 5
-- 2 + 1 + 2
-- 1 + 1 + 0 + 1 + 1 + 1 + 0

--15
--7 + 1 + 7 (2)
--3 + 1 + 3 + 1 + 3 + 1 + 3 (4)
--1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1
-- O(nlogn)
-- 8 [1,2,4,6,7]
-- n + 1  [1..n] O(n)
-- c n_0 0 <= f(n) <= c*g(n) => f(n) = O(g(n))
-- F(N) = 2n g(n) = n f(n) = O(g(n))
--f(n) = 4(n^3) + 3n^2 + n* log n => O(n^3)
--
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)

union :: [a] -> [a] -> [a]
union [] [] = []
union [] ys = ys
union xs [] = xs
union (x:xs) (y:ys) = case elem x (y:ys) of
                          True -> union xs ys
                          False -> x: union xs (y:ys)
--f(n) = n => O(n)
--ele

-- n(log n )
