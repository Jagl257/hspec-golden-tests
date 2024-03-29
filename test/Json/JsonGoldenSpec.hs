module Json.JsonGoldenSpec where

import           Test.Hspec
import           Test.Hspec.Golden
import           Json
import qualified Data.ByteString.Lazy as B         


goldenBytestring :: String -> B.ByteString -> Golden B.ByteString
goldenBytestring name actualOutput =
    Golden {
        output = actualOutput,
        encodePretty = show,
        writeToFile = B.writeFile,
        readFromFile = B.readFile,
	goldenFile = ".golden" <> name <> "-golden",
	actualFile = Just (".golden" <> name <> "-actual"),
	failFirstTime = False
    }


spec :: Spec
spec =
  describe "encodeCountries" $ do
   it "encodes a group of Countries into a JSON String " $
    defaultGolden "json" (show $ encodeCountries countries)
  
   it "encodes a group of Countries into a JSON bytestring " $
    goldenBytestring "json" (encodeCountries countries)
