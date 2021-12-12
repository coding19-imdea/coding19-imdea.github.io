module Lib where

import Data.List
import Combinatorics

prepare :: Integer -> [Integer] -> ([Integer] , [Integer])
prepare n ns = (take (fromInteger n) ns' , reverse $ drop (fromInteger n) ns')
  where
    ns' = sort ns

solve :: Integer -> [Integer] -> Integer
solve n ns =
  (res * (binomial (2*n) n)) `mod` 998244353
  where
    (as,bs) = prepare n ns
    suma = sum as
    sumb = sum bs
    res = sumb - suma
