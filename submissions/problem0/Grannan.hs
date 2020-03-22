module QuadPrimes where

import Control.Monad.State
import Data.Map as Map

type PrimeMap = Map Int Bool


isPrime' :: Int -> Bool
isPrime' x = x > 1 && all (\n ->  x `mod` n /= 0) [2.. (ceiling . sqrt) (fromIntegral x)]

isPrime :: Int -> State PrimeMap Bool
isPrime x = do
  map     <- get
  case Map.lookup x map of
    Just r  -> return r
    Nothing ->
      let
        r    = isPrime' x
      in
        put (Map.insert x r map) >> return r

doQuad :: (Int, Int) -> Int -> Int
doQuad (a, b) n = n * n + a * n + b

numConsecutiveQuadPrimes :: (Int, Int) -> State PrimeMap Int
numConsecutiveQuadPrimes (a, b) =
  let nqp n = do
        p <- isPrime $ doQuad (a, b) n
        if p then nqp (n + 1) else return n
  in
    nqp 0

tupls = do
  a <- [-999..999]
  b <- [-1000..1000]
  return (a, b)

getBestTupl :: State (PrimeMap, (Int, Int), Int) (Int, Int)
getBestTupl =
  go tupls
  where
    go :: [(Int, Int)] -> State (PrimeMap, (Int, Int), Int) (Int, Int)
    go [] = do
      (_, tupl, _) <- get
      return tupl
    go (candidate:xs) = do
      (pm, bestTupl, bestNumPrimes) <- get
      let (candidateNumPrimes, pm') = runState (numConsecutiveQuadPrimes candidate) pm
      _ <- if candidateNumPrimes > bestNumPrimes then
        put (pm', candidate, candidateNumPrimes)
      else
        put (pm', bestTupl, bestNumPrimes)
      go xs

result = uncurry (*) $ evalState getBestTupl (Map.fromList [], (0,0), 0)
