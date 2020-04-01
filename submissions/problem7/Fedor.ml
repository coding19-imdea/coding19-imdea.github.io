
let rec fs goz gzz boz bzz r = function
  | 1 -> r
  | 2 -> r
  | n -> fs (20*bzz) (30*gzz) (25*boz) (25*goz) (r + 20*gzz + 20*bzz) (n - 2)

let solution n =
  if n mod 2 = 0 then
    (fs 0 30 25 0 20 n) + (fs 0 0 5 5 0 (n - 1))
  else
    (fs 0 30 25 0 20 (n - 1)) + (fs 0 0 5 5 0 n)

let () =
  Printf.printf "%d\n" (solution 8)
