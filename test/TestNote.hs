{-# OPTIONS_GHC -F -pgmF htfpp #-}
module TestNote (htf_thisModulesTests, main) where


import Test.Framework
import Music


main :: IO ()
main = htfMain htf_thisModulesTests


test_note_show :: IO ()
test_note_show = do
  assertEqual "A" $ show A

