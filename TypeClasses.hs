module HChord.TypeClasses where

class ExactEq a where
  (===) :: a -> a -> Bool
  (/==) :: a -> a -> Bool

class Transposable a where
  (^) :: a -> b -> a


