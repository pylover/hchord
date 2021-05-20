module Harmony where

data Interval a = FullStep Int
                | HalfStep Int
                deriving(Show)

data Note = AFlat
          | A
          | ASharp
          | BFlat
          | B
          | C
          | CSharp
          | DFlat
          | D
          | DSharp
          | EFlat
          | E
          | F
          | FSharp
          | GFlat
          | G
          | GSharp

instance Show Note where
  show AFlat  = "Ab"
  show A      = "A"
  show ASharp = "A#"
  show BFlat  = "Bb"
  show B      = "B"
  show C      = "C"
  show CSharp = "C#"
  show DFlat  = "Db"
  show D      = "D"
  show DSharp = "D#"
  show EFlat  = "Eb"
  show E      = "E"
  show F      = "F"
  show FSharp = "F#"
  show GFlat  = "Gb"
  show G      = "G"
  show GSharp = "G#"

--class Note a where 
--  (+) :: a -> Interval -> a
