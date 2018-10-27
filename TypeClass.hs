module TypeClass where
import Prelude hiding (Num, GHC)
class Double a where
    (+), (-), (*)       :: a -> a -> a

class Equiv a where
    (===) :: a -> a -> Bool


compare' :: (Equiv a) => a -> a-> Bool
compare' x y = (===) x y


