module HChord.Note where

import HChord.TypeClasses
import HChord.Interval

data Note
  = A
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
  | AFlat
  deriving (Enum)

instance ExactEq Note where
  (===) a b = fromEnum a == fromEnum b
  (/==) a b = fromEnum a /= fromEnum b

-- instance Transposable Note where
--   (^) n (HalfStep h) = 

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

instance Eq Note where
  (==) a b = steps a == steps b

steps :: Note -> Interval
steps A        = HalfStep 0
steps ASharp   = HalfStep 1
steps BFlat    = HalfStep 1
steps B        = HalfStep 2
steps C        = HalfStep 3
steps CSharp   = HalfStep 4
steps DFlat    = HalfStep 4
steps D        = HalfStep 5
steps DSharp   = HalfStep 6
steps EFlat    = HalfStep 6
steps E        = HalfStep 7
steps F        = HalfStep 8
steps FSharp   = HalfStep 9
steps GFlat    = HalfStep 9
steps G        = HalfStep 10
steps GSharp   = HalfStep 11
steps AFlat    = HalfStep 11

note :: Interval -> Note
note (HalfStep 0) = A
note (HalfStep 1) = ASharp
note (HalfStep 2) = B
note (HalfStep 3) = C
note (HalfStep 4) = CSharp
note (HalfStep 5) = D
note (HalfStep 6) = DSharp
note (HalfStep 7) = E
note (HalfStep 8) = F
note (HalfStep 9) = FSharp
note (HalfStep 10) = G
note (HalfStep 11) = GSharp
note (WholeStep 0) = A
note (WholeStep 1) = B
note (WholeStep 2) = CSharp
note (WholeStep 3) = DSharp
note (WholeStep 4) = F
note (WholeStep 5) = G
note (HalfStep n) = note $ HalfStep (mod n 12)

alter :: Note -> Note
alter ASharp   = BFlat
alter BFlat    = ASharp
alter CSharp   = DFlat
alter DFlat    = CSharp
alter DSharp   = EFlat
alter EFlat    = DSharp
alter FSharp   = GFlat
alter GFlat    = FSharp
alter GSharp   = AFlat
alter AFlat    = GSharp
alter a        = a
