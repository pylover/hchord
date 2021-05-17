import Test.HUnit

test1 = TestCase (assertEqual "test1" 2 2)

tests = TestList [TestLabel "test1" test1]

main :: IO ()
main = runTestTT tests >>= print
