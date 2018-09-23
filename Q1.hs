double :: [Int] -> [Int]
double [] = []
double [a] = [a]
double (b:c:xs) = b : 2*c : double xs