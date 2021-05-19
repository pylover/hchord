{-# OPTIONS_GHC -F -pgmF htfpp #-}
module TestParser (htf_thisModulesTests) where

import Test.Framework

test_ = do
  assertEqual 2 2

