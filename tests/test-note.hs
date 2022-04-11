{-# OPTIONS_GHC -F -pgmF htfpp #-}

import Test.Framework hiding ((===))
import HChord.Interval
import HChord.Note
import HChord.TypeClasses

main = htfMain htf_thisModulesTests

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
  assertBool $ alter AFlat /== AFlat
  assertBool $ alter AFlat === GSharp

test_note_constructor = do
  assertEqual (note (WholeStep 1)) (note (HalfStep 2))
  assertEqual (note (HalfStep 12)) A
  assertEqual (note (HalfStep 13)) ASharp
