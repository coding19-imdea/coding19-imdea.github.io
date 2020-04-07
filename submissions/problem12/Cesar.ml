open Printf

exception Error

module Sols = Set.Make(Int)

let sols=Sols.empty
  
let listfromto a b =
  let rec from i = if i=b then [b] else i::(from (i+1)) in  from a
    
let listn max = listfromto 0 max
let list21 = listn 20

let shiftone a = match a with [] -> raise Error | x::xs -> xs@[x]
let rec shift a n = if n=0 then a else (shift  (shiftone a) (n-1))
  
let id ls =
  let calc ls = List.fold_left (fun n x -> n*2+x) 0 ls in
  List.fold_left (fun best n -> let v=(calc (shift ls n)) in if v>best then v else best) 0 list21
  
let allshifts ls = List.map (shift ls) list21
let ids  lss  = List.map id lss
let max x y = if x>y then x else y
let calcmax ids   = List.fold_left max 0 ids
let check_legal ls=
  let rec check_ones n xs = if n=0 then 0 else match xs with []-> 0 | x::tl -> x+(check_ones (n-1) tl) in
  (check_ones 5 ls)<=2 
let legal lss = List.for_all check_legal lss

let check ls sols =
  let all = allshifts ls in
  if not (legal all) then sols
  else
    let ids = ids all in
    let m = (calcmax ids) in
    if (Sols.mem m sols) then sols else Sols.add m sols

let solve () =
  let rec guess i ls sols =
    if i=21 then (check ls sols)
    else let s2 = (guess (i+1) (0::ls) sols) in (guess (i+1) (1::ls) s2)
  in
  guess 0 [] Sols.empty


let _ =
  let sols = solve () in
  printf "%d\n" (Sols.cardinal sols)
