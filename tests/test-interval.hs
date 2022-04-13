{-# OPTIONS_GHC -F -pgmF htfpp #-}

import Debug.Trace
import Data.List
import GHC.Exception.Type
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

test_interval_add = do
  assertBool $ (HalfStep 1 + HalfStep 3) `is` (WholeStep 2)
  assertBool $ (HalfStep 1 + WholeStep 3) `is` (HalfStep 7)
  assertBool $ (WholeStep 3 + HalfStep 1) `is` (HalfStep 7)
  assertBool $ (WholeStep 3 + WholeStep 1) `is` (WholeStep 4)

test_interval_minus = do
  assertBool $ (HalfStep 1 - HalfStep 3) `is` (WholeStep (-1))
  assertBool $ (HalfStep 6 - WholeStep 1) `is` (WholeStep 2)
  assertBool $ (WholeStep 3 - HalfStep 1) `is` (HalfStep 5)
  assertBool $ (WholeStep 3 - WholeStep 1) `is` (WholeStep 2)

test_interval_multiply = do
  assertBool $ (HalfStep 2 * HalfStep 3) `is` (WholeStep 3)
  assertBool $ (HalfStep 6 * WholeStep 1) `is` (WholeStep 6)
  assertBool $ (WholeStep 3 * HalfStep 1) `is` (WholeStep 3)
  assertBool $ (WholeStep 3 * WholeStep 1) `is` (WholeStep 3)

test_interval_abs = do
  assertBool $ (abs (HalfStep (-3))) `is` (HalfStep 3)
  assertBool $ (abs (WholeStep (-1))) `is` (WholeStep 1)
  assertBool $ (abs (HalfStep (-4))) `is` (WholeStep 2)

assertError :: String -> SomeException -> Bool
assertError s (SomeException e) = isPrefixOf s (show e)

test_interval_fromInteger = do
  assertThrows (fromInteger 2 :: Interval) (assertError "Not Supported")
