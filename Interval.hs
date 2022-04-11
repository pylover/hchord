module HChord.Interval where

data Interval
  = WholeStep Int
  | HalfStep Int

instance Show Interval where
  show (WholeStep 1)  = "1 Step"
  show (WholeStep a)  = (show a) ++ " Steps"

  show (HalfStep 1)  = "1 HalfStep"
  show (HalfStep a)  = (show a) ++ " HalfSteps"

instance Eq Interval where
  (==) (HalfStep h) (WholeStep w) = h == (w * 2)
  (==) (WholeStep w) (HalfStep h) = h == (w * 2)
  (==) (HalfStep a) (HalfStep b) = a == b
  (==) (WholeStep a) (WholeStep b) = a == b
