{-# LANGUAGE RecordWildCards #-}

module Main where 

import Control.Monad.State.Lazy
import qualified Data.List as L 
import Debug.Trace 

main :: IO () 
main = putStrLn (show $ solution)


solution :: Int 
solution = length $ [(i8,i7,i6,i5,i4,i3,i2,i1) | 
                  i8 <- [0..1], 
                  i7 <- [0..200-200*i8], 
                  i6 <- [0..200-200*i8-100*i7], 
                  i5 <- [0..200-200*i8-100*i7-50*i6], 
                  i4 <- [0..200-200*i8-100*i7-50*i6-20*i5], 
                  i3 <- [0..200-200*i8-100*i7-50*i6-20*i5-10*i4], 
                  i2 <- [0..200-200*i8-100*i7-50*i6-20*i5-10*i4-5*i3], 
                  i1 <- [0..200-200*i8-100*i7-50*i6-20*i5-10*i4-5*i3-2*i2], 
                  200 * i8 + 100 * i7 + 50 * i6 + 20 * i5 + 10 * i4 + 5 * i3 + 2 * i2 + i1 == 200 ]