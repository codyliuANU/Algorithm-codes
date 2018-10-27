double :: [Int] -> [Int]
double [] = []
double [a] = [a]
double (b:c:xs) = b : 2*c : double xs


data BST a = Null | Node a (BST a) (BST a)
     deriving (Show,Eq,Ord)


predecessor :: (Ord a , Num a) => BST a -> a -> [a]
predecessor Null _ = [-1]
predecessor (Node c l r) v = if c >= v then [c] ++ (predecessor l v) ++ (predecessor r v) else [-1]


test :: (Num a) => BST a
test = Node 5
       ( Node 3
          (Node 1 Null Null)
          (Node 4 Null Null)
       )
         Null