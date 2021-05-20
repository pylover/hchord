{-# OPTIONS_GHC -F -pgmF htfpp #-}

import Test.Framework

import Harmony

test_interval_show = do
  assertEqual "1 Step" $ show (FullStep 1)
  assertEqual "2 Steps" $ show (FullStep 2)
  assertEqual "1 HalfStep" $ show (HalfStep 1)
  assertEqual "2 HalfSteps" $ show (HalfStep 2)
  
--assertEqual "FullStep 1" (show FullStep 1)

main = htfMain htf_thisModulesTests
