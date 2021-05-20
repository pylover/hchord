{-# OPTIONS_GHC -F -pgmF htfpp #-}

import Test.Framework

import Harmony

test_interval_show = do
  assertEqual "FullStep 1" $ show (FullStep 1)
  
--assertEqual "FullStep 1" (show FullStep 1)

main = htfMain htf_thisModulesTests
