module HChord.TypeClasses where

class Is a where
  is :: a -> a -> Bool
  isNot :: a -> a -> Bool

class Transposable a where
  (^) :: a -> b -> a


