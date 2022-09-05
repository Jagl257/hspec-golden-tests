module FizzBuzz.FizzBuzzGoldenSpec where

import           Test.Hspec                   --Tests
import           Test.Hspec.Golden            --Golden Tests
import           FizzBuzz                     -- SUT


spec :: Spec
spec = 
    describe "FizzBuzz" $
      it "Turns multiples of 3 to Fizz and multiples of 5 to Buzz" $
        defaultGolden "FizzBuzz" (show $ fizzBuzz [1,2,3,4,5,11,12,13,14,15])
