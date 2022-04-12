{-# OPTIONS_GHC -F -pgmF htfpp #-}

import Test.Framework
import HChord.Interval
import HChord.TypeClasses

main = htfMain htf_thisModulesTests

test_interval_show = do
  assertEqual "1 Step" $ show (WholeStep 1)
  assertEqual "2 Steps" $ show (WholeStep 2)
  assertEqual "1 HalfStep" $ show (HalfStep 1)
  assertEqual "2 HalfSteps" $ show (HalfStep 2)

test_interval_eq = do
  assertEqual (HalfStep 1) (HalfStep 1)
  assertEqual (HalfStep 2) (WholeStep 1)
  assertNotEqual (HalfStep 3) (WholeStep 2)

test_interval_semigroup = do
  assertBool $ (HalfStep 1 <> HalfStep 3) `is` (WholeStep 2)
  assertBool $ (HalfStep 1 <> WholeStep 3) `is` (HalfStep 7)
