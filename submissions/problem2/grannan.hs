module Coinsums where

coins = [200, 100, 50, 20, 10, 5, 2, 1]

make :: [Int] -> Int -> [[Int]]
make allowed amount =
  if amount == 0 then
    [[]]
  else
    let
      usable = filter (<= amount) allowed
    in
      do
        largestCoin <- usable
        let allowed' = filter (<= largestCoin) usable
        withLargestCoin <- make allowed' (amount - largestCoin)
        return (largestCoin : withLargestCoin)

result = length $ make coins 200
