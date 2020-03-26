module Main where 

import Data.List

main :: IO ()
main = putStrLn $ "Solution = " ++ show solve 

solve :: Int
solve = snd $ maximumBy cmpFst
               [ (maxPrimes (\n -> n^2 + a * n + b), a*b) 
               | a <- [-maxA..maxA], b <- [-maxB .. maxB]
               ]
  where maxA   = 999 
        maxB   = 1000 
        
        maxPrimes f = length $ takeWhile ((primes!!) . abs) (f <$> [2..])
        primes      = False:False:[isPrime n | n <- [2..]]
        isPrime n   = all (==1) (gcd n <$> [2..n-1]) 
               
        cmpFst (x,_) (y,_) = compare x y 
