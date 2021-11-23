module Prob45 where 
import Data.Bits

result :: Int 
result = mxor 1000000000000 999999999999999999

mxor :: Int -> Int -> Int 
mxor l h = toInt $ replicate n True
  where 
    n = maxDiff (length hbits) (reverse hbits) (reverse lbits)
    maxDiff i (x:xs) (y:ys)
      | x /= y    = i 
      | otherwise = maxDiff (i-1) xs ys 
    maxDiff i [] [] 
      = 0 
    hbits  = fromBits h 
    lbits' = fromBits l 
    lbits  = lbits' ++ replicate (length hbits - length lbits') False 


mxorSpec :: Int -> Int -> Int 
mxorSpec l r = maximum [ x `xor` y | x <- [l..r], y <- [x..r]]

toInt :: [Bool] -> Int 
toInt xs = go 1 xs 
  where 
    go i (b:bs) = (if b then i else 0) + go (2*i) bs
    go i [] = 0 

fromBits :: Bits a => a -> [Bool]
fromBits b
    | b == zeroBits = []
    | otherwise     = testBit b 0 : fromBits (shiftR b 1)
