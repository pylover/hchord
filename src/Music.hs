module Music 
  ( PitchClass(..),
    Pitch(..),
    Note(..),
    Octave(..),
    Accidental(..),
  ) where


data PitchClass 
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


data Note = Note PitchClass Accidental
  deriving (Show, Eq)


data Pitch = Pitch Note Octave
  deriving (Show, Eq)


data Chord 
  = Minor Note
  | Major Note
  deriving (Show, Eq)
