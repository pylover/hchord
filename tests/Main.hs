import System.Exit (exitFailure)
import Test.QuickCheck (Result(Success), Testable, quickCheckResult)

import TestParser

isPassed :: Result -> Bool
isPassed (Success _ _ _ _ _ _) = True
isPassed _ = False

check :: Testable test => test -> IO ()
check test = do
  r <- quickCheckResult test
  if not $ isPassed r then exitFailure else return ()

main = do 
  check test1
