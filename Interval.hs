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

instance Is Interval where
  is (HalfStep a) (HalfStep b) = a == b
  is (WholeStep a) (WholeStep b) = a == b
  is _ _ = False
  isNot a b = not $ is a b

instance Eq Interval where
  (==) (HalfStep h) (WholeStep w) = h == (w * 2)
  (==) (WholeStep w) (HalfStep h) = h == (w * 2)
  (==) (HalfStep a) (HalfStep b) = a == b
  (==) (WholeStep a) (WholeStep b) = a == b

instance Num Interval where
  (+) (WholeStep w) (HalfStep b) = simplify $ HalfStep ((w * 2) + b)
  (+) (HalfStep b) (WholeStep w) = simplify $ HalfStep ((w * 2) + b)
  (+) (HalfStep a) (HalfStep b) = simplify $ HalfStep (a + b)
  (+) (WholeStep a) (WholeStep b) = WholeStep (a + b)
  
  (-) (HalfStep a) (HalfStep b) = simplify $ HalfStep (a - b)
  (-) (HalfStep h) (WholeStep w) = simplify $ HalfStep (h - (w * 2))
  (-) (WholeStep w) (HalfStep h) = simplify $ HalfStep ((w * 2) - h)
  (-) (WholeStep a) (WholeStep b) = WholeStep (a - b)

  (*) (HalfStep a) (HalfStep b) = simplify $ HalfStep (a * b)
  (*) (HalfStep h) (WholeStep w) = simplify $ HalfStep (h * (w * 2))
  (*) (WholeStep w) (HalfStep h) = simplify $ HalfStep (h * (w * 2))
  (*) (WholeStep a) (WholeStep b) = WholeStep (a * b)

  abs (HalfStep h) = simplify $ HalfStep (abs h)
  abs (WholeStep w) = WholeStep (abs w)
  
  fromInteger a = error "Not Supported"

  signum (HalfStep h) = HalfStep (signum h)
  signum (WholeStep h) = WholeStep (signum h)

simplify :: Interval -> Interval
simplify (HalfStep h)
  | h `mod` 2 == 0 = WholeStep (h `div` 2)
  | otherwise = HalfStep h
simplify x = x
