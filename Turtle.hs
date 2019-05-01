module Turtle where

import CodeWorld

type Radians = Double

-- | The commands that we can send to our turtle.
data TurtleCommand
  = Forward Double -- ^ Drive forward the given number of units,
                   -- drawing if the pen is down.
  | Turn Radians -- ^ Turn the turtle. Positive values are
                 -- anticlockwise; negative values are clockwise.
  | PenUp -- ^ Lift the pen, so that future 'Forward' instructions do
          -- not draw.
  | PenDown -- ^ Lower the pen, so that future 'Forward' instructions
            -- will draw.
  deriving (Eq, Show)

-- Task 1: Drawing Shapes

triangle :: Double -> [TurtleCommand]
triangle = undefined -- TODO

polygon :: Int -> Double -> [TurtleCommand]
polygon = undefined -- TODO


-- Task 2: Interpreting Turtle Commands
data TurtleState = TS Position Direction PenState
  deriving (Show)
type Position = (Double,Double)
type Direction = Radians
data PenState = Up | Down
  deriving (Show, Enum)

runTurtle :: [TurtleCommand] -> Picture
runTurtle [] = blank
runTurtle list = runTurtle' (TS (0,0) (pi/2) Up) list
-- TODO

runTurtle' :: TurtleState -> [TurtleCommand] -> Picture
runTurtle' _ [] = blank
runTurtle (TS (x,y) r Up) (x:xs) =
    case x of
        PenDown -> runTurtle' (TS (x,y) r Down) xs
        Forward d -> runTurtle' (TS (d * (cos r) + x, d * (sin r) + y) r Up) xs

        Turn r' -> runTurtle' (TS (x,y) (r+r') Up) xs
        PenUp -> runTurtle' (TS (x,y) r Up) xs
runTurtlr (TS (x,y) r Down) (x:xs) =
    case x of
        PenDown -> runTurtle' (TS (x,y) r Down) xs
        Forward d -> polyline [(x,y),(d * (cos r) + x, d * (sin r) + y)] & runTurtle' (TS (d * (cos r) + x, d * (sin r) + y) r Down) xs
        Turn r' -> runTurtle' (TS (x,y) (r+r') Down) xs
        PenUp -> runTurtle' (TS (x,y) r Up) xs

moveTurtle :: TurtleState -> Double -> Radians -> TurtleState
moveTurtle (TS (x,y) r s) d r' = (TS (d * (cos r) + x, d * (sin r) + y) r s)


-- Task 3: Sierpinski's Triangle
--   COMP1100: Implement this directly (Task 3A)
--   COMP1130: Implement this using an L-System (Task 3B)

sierpinski :: Int -> Double -> [TurtleCommand]
sierpinski 0 _ = []
sierpinski 1 d = triangle d
sierpinski n d = sierpinski' n n' d

sierpinsky' n n' d
 | n == n' = []
 | otherwise = triangle (d/(2^n)) ++ [Forward d/(2^n)] ++ triangle (d / (2^n)) ++
    [Turn (2*pi/3), Forward (d/(2^n)), Turn (2*pi/3)] ++ triangle (d/ (2^n))-- TODO


-- Task 3B: L-Systems (COMP1130 Only)

lSystemCommands :: [TurtleCommand]
lSystemCommands = undefined -- TODO



-- | A more complex example to test your interpreter.
comp1100 :: [TurtleCommand]
comp1100 = concat [start, c, o, m, p, one, one, o, o]
  where
    start = [PenUp, f 1.5, l, f 9.25, r]
    c =
      [ r, f 1.5
      , l, f 0.5, PenDown
      , l, l', f d
      , r', f 1
      , r', f d
      , r', f 2
      , r', f d
      , r', f 1
      , r', f d, PenUp
      , r', f 2.5
      , l, f 1
      , l
      ]
    o =
      [ r, f 1.5
      , l, f 0.5, PenDown
      , l, l', f d
      , r', f 1
      , r', f d
      , r', f 2
      , r', f d
      , r', f 1
      , r', f d
      , r', f 2, PenUp
      , f 0.5
      , l, f 1
      , l
      ]
    m =
      [ l, f 0.5, r, PenDown
      , f 3
      , r, r', f (d * 2)
      , l, f (d * 2)
      , r, r', f 3, PenUp
      , l, f 1, l
      ]
    p =
      [ l, f 0.5, r, PenDown
      , f 2.5
      , r', f d
      , r', f 1
      , r', f d
      , r', f 1
      , r', f d
      , r', f 1
      , r', f d, PenUp
      , r, r', f 3
      , r, f 1.5
      , l, l
      ]
    one =
      [ PenDown
      , r, f 1
      , l, l, f 0.5
      , r, f 3
      , l, l', f d, PenUp
      , f d
      , l', f 2
      , l, f 2.5
      , l
      ]

    f = Forward

    -- Left/Right turns, 90 degrees. Primed versions (the ones with an
    -- ' after: l', r') are 45 degrees.
    l = Turn (pi / 2)
    l' = Turn (pi / 4)
    r = Turn (-pi / 2)
    r' = Turn (-pi / 4)

    -- Diagonal length of a right-angle triangle with both sides 0.5
    d = sqrt (2 * 0.5 * 0.5)
