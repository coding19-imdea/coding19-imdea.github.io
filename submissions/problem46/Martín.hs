-- | The idea is to try to maximize the '1' in the solution.

module BitCount where


maxM :: Integer -> Integer -> Integer
maxM l m = if m < (2 ^ l) then l-1
           else maxM (l+1) m

testPow :: Integer -> Integer -> Integer -> Bool
testPow l r m = let m2 = 2^m in m2 <= r && m2-1 >= l

bits :: Integer -> Integer -> Integer
bits l r =
  let mm = maxM 1 r in
    if mm > 0 then
    (
      if testPow l r mm
    then 2^(mm+1) - 1
    else bits (div l 2) (div r 2)
    ) else 0
-- toInt :: [Bool] -> Integer
-- toInt = comp 1 . reverse
--   where
--     comp n [] = n
--     comp n (b : xs) = comp (2*n + if b then 1 else 0) xs

solution :: Integer -> Integer -> Integer
solution = bits
