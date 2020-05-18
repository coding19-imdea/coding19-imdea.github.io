open Printf

let rec gcd u v =  if v <> 0 then (gcd v (u mod v)) else (abs u)
 
let lcm m n =
  match m, n with
  | 0, _ | _, 0 -> 0
  | m, n -> abs (m * n) / (gcd m n)


let simplify (n,d) = let c = gcd n d in (n/c),(d/c)
    
let frac_sum (xn,xd) (yn,yd) =
  let d = lcm xd yd in
  let n = xn * (d/xd) + yn * (d/yd) in
  simplify (n,d)
    
let inv (n,d) = (d,n)
let frac_inv_sum x y = inv (frac_sum (inv x) (inv y))

module IntInt = struct
  type t = int * int
  let compare = compare
end
  
module SolSet = Set.Make(IntInt)

let c = (60,1)


let combine a b =
  let f x =
    let s1 = SolSet.map (fun y -> frac_sum x y) b in
    let s2 = SolSet.map (fun y -> frac_inv_sum x y) b in
    SolSet.union s1 s2 in
  SolSet.fold (fun x s -> SolSet.union (f x) s) a SolSet.empty
  
let d n =
  let sols = Array.make (n+1) SolSet.empty in
  let rec solve i  =
    if i = 1 then (Array.set sols i (SolSet.singleton c))
    else
      let rec aux j =
	let s = combine sols.(j) sols.(i-j) in
	if j=1 then s else SolSet.union s (aux (j-1))
      in
      solve (i-1) ;
      Array.set sols i (aux (i-1))
  in
  let rec upto i =if i = 1 then sols.(i) else SolSet.union sols.(i)  (upto (i-1)) in
  solve n ; (SolSet.cardinal (upto n))
      
  
let _ =
  let n = Stdlib.read_int () in
  printf "%d\n" (d n)
