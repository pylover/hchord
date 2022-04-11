{-# OPTIONS_GHC -F -pgmF htfpp #-}

import Test.Framework hiding ((===))

import HChord.Note

test_note_show = do
  assertEqual "Ab" $ show AFlat
  assertEqual "A" $ show A
  assertEqual "A#" $ show ASharp

test_note_eq = do
  assertEqual AFlat GSharp
  assertEqual DFlat CSharp
  assertEqual CSharp DFlat

  assertNotEqual AFlat A

test_note_alter = do
  assertBool $ AFlat === AFlat
  assertBool $ AFlat /== GSharp

main = htfMain htf_thisModulesTests
