module Main where 

main :: IO ()
main = putStrLn (concat $ map show solution)

solution :: [Integer] 
solution = go input
  where 
   go xs = if null xs then [] else i:go (apply i xs) where i = pick xs 

pick :: [[Integer]] -> Integer
pick input = head [i | i <- head <$> input, not (i `elem` concat (apply i input))]
  where picks = head <$> input 

apply :: Integer -> [[Integer]] -> [[Integer]]
apply n  = filter (not . null) . map (\xs -> if head xs == n then tail xs else xs)

input :: [[Integer]]
input = map (\xs -> [xs `div` 100, xs `mod` 100 `div` 10, xs `mod` 100 `mod` 10]) 
          [ 319, 680, 180, 690, 129, 620, 762, 689
          , 318, 368, 710, 720, 629, 168, 160
          , 716, 731, 736, 729, 316, 769
          , 290, 719, 389, 162, 289, 718
          , 790, 890, 362, 760
          , 380, 728]