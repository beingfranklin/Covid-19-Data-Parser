{-# LANGUAGE DeriveGeneric #-}

module Parse
    ( parse,
    OuterRecords (records)
    ) where

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as L8
import GHC.Generics

data InnerRecord = InnerRecord {
   dateRep :: String,
    day :: String,
    year :: String,
    cases ::  Int,
    deaths :: Int,
    countriesAndTerritories ::  String
} deriving (Show, Generic)
    
instance FromJSON InnerRecord
instance ToJSON InnerRecord

data OuterRecords = OuterRecords{
    records :: [InnerRecord]
}deriving (Show, Generic)

instance FromJSON OuterRecords
instance ToJSON OuterRecords

parse :: L8.ByteString -> Either String OuterRecords
parse json = eitherDecode json :: Either String OuterRecords

