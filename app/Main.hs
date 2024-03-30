module Main (main) where


import Music


main :: IO ()
main = print n >> print p
  where p = Pitch n Middle
        n = Note A Natural
