module Music 
  ( Note(..),
    Tone(..),
  ) where


data Note 
  = A 
  | B 
  | C 
  | D 
  | E 
  | F 
  | G 
  deriving (Show, Eq)


data Octave 
  = TriplePedal 
  | DoublePedal
  | Pedal
  | Bass
  | Middle
  | Treble
  | Top
  | DoubleTop
  | TripleTop
  deriving (Show, Eq)


data Accidental
  = Flat
  | Sharp
  | Natural
  deriving (Show, Eq)


data Tone = Tone
  { getNote :: Note
  , getAccidental :: Accidental
  , getOctave :: Octave
  } deriving (Show, Eq)


-- data Chord 
--   = Triad 
--   | Seventh
