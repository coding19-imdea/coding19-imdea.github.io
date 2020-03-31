-- Solution: 24702
module Main where 

import Data.List 

main :: IO ()
main = do 
    ins <- (chunksOf 10 . lines) <$> readFile "sudoku.txt"
    -- putStrLn (show ins)
    let sols = (solve . parseGrid) <$> ins 
    -- putStrLn (show $ sols )
    putStrLn (show $ sum $ (make3 <$> sols))

make3 :: Grid -> Int 
make3 grid = (\[i1,i2,i3] -> i1 * 100 + i2 * 10 + i3) $ take 3 $ head grid

chunksOf :: Int -> [a] -> [[a]]
chunksOf i = go [] i 
  where 
      go acc _ [] = [reverse acc]  
      go acc 0 xs = reverse acc:go [] i xs 
      go acc i (x:xs) = go (x:acc) (i-1) xs 

parseGrid :: [String] -> Grid    
parseGrid xs =  map (map readChar) (tail xs) 
  where 
      readChar :: Char -> Value
      readChar x = read [x]

solve                :: Grid -> Grid
solve                =  head . search . prune . choices

search                :: Matrix Choices -> [Grid]
search m
 | blocked m          =  []
 | complete m         =  collapse m
 | otherwise          =  [g | m' <- expand m
                            , g  <- search (prune m')]

expand                :: Matrix Choices -> [Matrix Choices]
expand m              =
   [rows1 ++ [row1 ++ [c] : row2] ++ rows2 | c <- cs]
   where
      (rows1,row:rows2) = break (any (not . single)) m
      (row1,cs:row2)    = break (not . single) row


complete              :: Matrix Choices -> Bool
complete              =  all (all single)

void                  :: Matrix Choices -> Bool
void                  =  any (any null)

safe                  :: Matrix Choices -> Bool
safe cm               =  all consistent (rows cm) &&
                         all consistent (cols cm) &&
                         all consistent (boxs cm)

consistent            :: Row Choices -> Bool
consistent            =  nodups . concat . filter single

blocked               :: Matrix Choices -> Bool
blocked m             =  void m || not (safe m)



type Grid             = Matrix Value
type Matrix a         = [Row a]
type Row a            = [a]
type Value            = Int

type Choices          =  [Value]
choices               :: Grid -> Matrix Choices
choices               =  map (map choice)
                         where
                            choice v = if empty v then values else [v]

boxsize               :: Int
boxsize               =  3

values                :: [Value]
values                =  [1..9]

empty                 :: Value -> Bool
empty                 =  (== 0)

single                :: [a] -> Bool
single [_]            =  True
single _              =  False

blank                 :: Grid
blank                 =  replicate n (replicate n 0) 
                        where n = boxsize ^ 2


rows                  :: Matrix a -> [Row a]
rows                  =  id

cols                  :: Matrix a -> [Row a]
cols                  =  transpose

boxs                  :: Matrix a -> [Row a]
boxs                  =  unpack . map cols . pack
                         where
                            pack   = split . map split
                            split  = chop boxsize
                            unpack = map concat . concat
chop n []             =  []
chop n xs             =  take n xs : chop n (drop n xs)

valid                 :: Grid -> Bool
valid g               =  all nodups (rows g) &&
                         all nodups (cols g) &&
                         all nodups (boxs g)

nodups                :: Eq a => [a] -> Bool
nodups []             =  True
nodups (x:xs)         =  not (elem x xs) && nodups xs



cp                    :: [[a]] -> [[a]]
cp []                 =  [[]]
cp (xs:xss)           =  [y:ys | y <- xs, ys <- cp xss]

collapse              :: Matrix [a] -> [Matrix a]
collapse              =  cp . map cp

prune                 :: Matrix Choices -> Matrix Choices
prune                 =  pruneBy boxs . pruneBy cols . pruneBy rows
                         where pruneBy f = f . map reduce . f

reduce                :: Row Choices -> Row Choices
reduce xss            =  [xs `minus` singles | xs <- xss]
                         where singles = concat (filter single xss)

minus                 :: Choices -> Choices -> Choices
xs `minus` ys         =  if single xs then xs else xs \\ ys
