-- ''flips'' ones into ones and underscores

auxFlip :: Int -> Int -> [Int]
auxFlip m n = let l = 2^(m+1) in
		if (n < l) then [n]
			else [n-l, -(2*l-n) ,n-l]

flp :: [Int] -> [Int] -> [Int]
flp lst [] = lst
flp lst (x:xs) = flp (concat (map (auxFlip x) lst)) xs

genLims :: Int -> Int -> [Int]
genLims b t =
	if (t == 0) then []
	else (b-1):(genLims (b-1) (t-1)) 

-- Generates line n for size 2^b and iteration t

genLine :: Int -> Int -> Int -> [Int]
genLine b n t =
	let size = 2^(b+1) - 1 in
	let line = [2*n+1] in
	let buf = [-(div (size - 2*n - 1) 2)] in
	let res = flp line (genLims b t) in
	buf ++ res ++ buf

paintLine :: [Int] -> String
paintLine [] = ""
paintLine (n:ns) = if (n>0) then (concat (replicate n "1")) ++ paintLine ns
			else (concat (replicate (-n) "_")) ++ paintLine ns

computeLine :: Int -> Int -> Int -> String
computeLine b n t = paintLine $ genLine b n t


paintTriangle :: Int -> Int -> IO()
paintTriangle b t = putStr $ concat [ (computeLine b i t)++"\n" | i <- [0..(2^b -1)] ]

main = do
  n <- getLine
  paintTriangle 5 (read n :: Int)
