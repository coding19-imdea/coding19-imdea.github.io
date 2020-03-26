module Password where

import Data.List
    
main :: IO ()
main = do
  file <- readFile "keylog.txt"
  putStrLn $ show $ passwordDerivation file
  
passwordDerivation :: String -> Int
passwordDerivation file = head $ filter (and . (flip map successfulAttempts) . (flip isSubsequenceOf) . show) [1..]
                          where successfulAttempts = lines file
