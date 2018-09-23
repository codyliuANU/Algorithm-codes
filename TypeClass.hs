module TypeClass where
import Prelude hiding (Num, GHC)
class Double a where
    (+), (-), (*)       :: a -> a -> a

