module Lib where

import Prelude hiding (init)

import Data.Array.MArray as Arr
import Data.Array.IO as IArr

import Control.Monad

import Data.List

type ArrInt = IOArray Int Integer

compute :: Int -> [(Int, Int)]
compute i = map (\r -> (head r, length r)) $ group $ map (div i) [ 2 .. i]

sumArrUpTo :: IOArray Int Integer -> Int -> IO Integer
sumArrUpTo arr p = sumPos arr [ 1 .. p]

sumPos :: IOArray Int Integer -> [Int] -> IO Integer
sumPos arr = foldM (\res pos -> (res+) <$> readArray arr pos) (0 :: Integer)

bruteforce :: IOArray Int Integer -> Int -> IO ()
bruteforce arr p = do
  -- We assume that sum is already there
  m1 <- readArray arr p
  -- m2 <- sumPos arr (zipWith div (repeat p) [ 2 .. p])
  -- let comp = compute p
  let comp = computeFaster p
  -- putStr "Debug: " >> print comp
  m2 <- foldM (\res (pos , fact) -> readArray arr pos >>= \m -> return ((toInteger fact)*m + res)) 0 comp
  let mres = m1 + m2
  writeArray arr p mres
  writeArray arr (p+1) (m1 + mres)

computeFaster :: Int -> [(Int,Int)]
computeFaster p =
  let fsqrt = fromInteger (floor (sqrt (fromInteger $ toInteger p))) in
  foldl (\res c -> let pd = p `div` c in if pd > fsqrt then (pd, 1) : res else
  res) [] [ 2 .. fsqrt ]
  ++
  foldl (\res c ->
           let num = (p `div` c) - (p `div` (c+1)) in
           (c, num) : res)
    []
  [ 1 .. fsqrt]

solveUpTo :: Int -> IO Integer
solveUpTo j | j > 2 = do
  arr <- newArray (0, j + 1) 0
  writeArray arr 0 0
  writeArray arr 1 1
  writeArray arr 2 2
  writeArray arr 3 3
  mapM_ (bruteforce arr) [ 3 .. j]
  readArray arr j
solveUpTo _ | otherwise = fail "cannot compute that"

-- someFunc :: IO ()
-- someFunc = putStrLn "someFunc"
