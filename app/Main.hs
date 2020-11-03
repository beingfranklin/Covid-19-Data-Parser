module Main where

import Http
import Parse

main :: IO ()
main = do
    let url = "https://opendata.ecdc.europa.eu/covid19/casedistribution/json/"
    json <- download url
    case (parse json) of
        Left err -> print err
        -- Print first record
        -- Right recs -> print . head $ (records recs)
        -- Print 5 records
        Right recs -> print . (take 5) $ (records recs)

        -- P.S It Outputs the haskell datatype we specified

