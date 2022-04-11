module HChord.Interval where

import HChord.TypeClasses

data Interval
  = WholeStep Int
  | HalfStep Int

instance Show Interval where
  show (WholeStep 1)  = "1 Step"
  show (WholeStep a)  = (show a) ++ " Steps"

  show (HalfStep 1)  = "1 HalfStep"
  show (HalfStep a)  = (show a) ++ " HalfSteps"

instance ExactEq Interval where
  (===) (HalfStep a) (HalfStep b) = a == b
  (===) (WholeStep a) (WholeStep b) = a == b
  (===) _ _ = False

instance Eq Interval where
  (==) (HalfStep h) (WholeStep w) = h == (w * 2)
  (==) (WholeStep w) (HalfStep h) = h == (w * 2)
  (==) (HalfStep a) (HalfStep b) = a == b
  (==) (WholeStep a) (WholeStep b) = a == b

instance Num Interval where
  (+) (HalfStep a) (HalfStep b) = simplify $ HalfStep (a + b)
  (+) (WholeStep w) (HalfStep b) = simplify $ HalfStep ((w * 2) + b)
  (+) (HalfStep b) (WholeStep w) = simplify $ HalfStep ((w * 2) + b)
  (+) (WholeStep a) (WholeStep b) = WholeStep (a + b)

simplify :: Interval -> Interval
simplify (HalfStep h)
  | h `mod` 2 == 0 = WholeStep (h `div` 2)
  | otherwise = HalfStep h
simplify x = x
