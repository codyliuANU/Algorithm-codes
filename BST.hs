module BST (
   Tree(Null, Node),
   size,
   depth
)where

data Tree a = Null | Node a (Tree a) (Tree a)
     deriving (Show)

size :: Tree a -> Int
size Null = 0
size (Node v l r) = 1 + (size l) + (size r)

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

-- [1,2,3] 2 5 = [1,2,5]