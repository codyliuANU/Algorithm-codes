module RSA where

import qualified Control.Exception as Exc
import Test.QuickCheck
import Data.Char hiding(isAscii)

isAscii :: [Char] -> Bool
isAscii []     =  True
isAscii (c:cs) = case elem c ['\x00'..'\x7F'] of
                     True -> isAscii cs
                     False -> False
-- Some Chinese Characters such as '我' '你'
-- is not allowed in this encoding. '\x80' is the maximum hex representation


convert :: [Char] -> Int -> Maybe [Char]
convert []     _ = Just []
convert (x:xs) k = case isAscii (x:xs) of
                   True -> Just (map (\x -> fromJust (lookup (((fromJust (lookup x codes)) + 3) `mod` 128) codes')) (x:xs))
                   False -> Nothing


-- Verizon 2
--lookup :: a -> [(a,b)] -> Maybe b
--lookup 3 [(1,'a'),(2,'b')] = Nothing
--lookup 2 [(1,'a'),(2,'b')] = Just 'b'
codes = zip ['\x00'..'\x7F'] [0..127]
codes' = zip [0..127] ['\x00'..'\x7F']
--Just 5 => 5
--Just '3' => '3'

fromJust (Just v) = v


fib' :: Int -> Int
fib' 0 = 0
fib' 1 = 1
fib' n = fib' (n-1) + fib' (n-2)
fib :: Int -> [Int]
fib 0 = [0]
fib n = fib' n : fib (n-1)

--[('\NUL',0),('\SOH',1),('\STX',2),('\ETX',3),('\EOT',4),('\ENQ',5),
-- ('\ACK',6),('\a',7),('\b',8),('\t',9),('\n',10),('\v',11),
-- ('\f',12),('\r',13),('\SO',14),('\SI',15),('\DLE',16),('\DC1',17),
-- ('\DC2',18),('\DC3',19),('\DC4',20),('\NAK',21),('\SYN',22),('\ETB',23),
-- ('\CAN',24),('\EM',25),('\SUB',26),('\ESC',27),('\FS',28),('\GS',29),('\RS',30),
-- ('\US',31),(' ',32),('!',33),('"',34),('#',35),('$',36),
-- ('%',37),('&',38),('\'',39),('(',40),(')',41),('*',42),
-- ('+',43),(',',44),('-',45),('.',46),('/',47),('0',48),
-- ('1',49),('2',50),('3',51),('4',52),('5',53),('6',54),
-- ('7',55),('8',56),('9',57),(':',58),(';',59),('<',60),
-- ('=',61),('>',62),('?',63),('@',64),('A',65),('B',66),
-- ('C',67),('D',68),('E',69),('F',70),('G',71),('H',72),
-- ('I',73),('J',74),('K',75),('L',76),('M',77),('N',78),
-- ('O',79),('P',80),('Q',81),('R',82),('S',83),('T',84),
-- ('U',85),('V',86),('W',87),('X',88),('Y',89),('Z',90),
-- ('[',91),('\\',92),(']',93),('^',94),('_',95),('`',96),
-- ('a',97),('b',98),('c',99),('d',100),('e',101),('f',102),
-- ('g',103),('h',104),('i',105),('j',106),('k',107),('l',108),
-- ('m',109),('n',110),('o',111),('p',112),('q',113),('r',114),
-- ('s',115),('t',116),('u',117),('v',118),('w',119),('x',120),
-- ('y',121),('z',122),('{',123),('|',124),('}',125),('~',126),('\DEL',127)]

elemOfIndex :: (Eq a ) => a -> [a] -> Int --ord
elemOfIndex _ []     = error "Not in the list!"
elemOfIndex k (x:xs) = case k == x of
                         True -> 0
                         False -> 1 + elemOfIndex k xs

union :: (Ord a, Eq a) => [a] -> [a] -> [a]
union [] [] = []
union (x:xs) (y:ys) = if elem x (y:ys)
                      then x : union xs (y:ys)
                      else union xs (y:ys)

data Tree a = Null | Node a (Tree a) (Tree a) deriving(Show,Ord,Eq)




elemT :: (Eq a) => Tree a -> a -> Bool
elemT Null v = False
elemT (Node x l r) v
 | x == v = True
 | x /= v = (elemT l v) || (elemT r v)