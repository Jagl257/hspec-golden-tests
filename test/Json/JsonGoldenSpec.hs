module Json.JsonGoldenSpec where

import           Test.Hspec
import           Test.Hspec.Golden
import           JSON.Json
import qualified Data.ByteString.Lazy as B         


goldenBytestring :: String -> B.ByteString -> Golden B.ByteString
goldenBytestring name actualOutput =
    Golden {
        output = actualOutput,
        encodePretty = show,
        writeToFile = B.writeFile,
        readFromFile = B.readFile,
        testName = name,
        directory = ".golden"
    }

-- @
--spec :: Spec
--spec =
--  describe "encodeCountries" $
--   it "encodes to JSON a group of Countries " $
--    defaultGolden "json" (encodeCountries countries)
-- @

spec :: Spec
spec =
    describe "encodeCountries" $
    it "encodes to JSON a group of Countries " $
    goldenBytestring "json" (encodeCountries countries)