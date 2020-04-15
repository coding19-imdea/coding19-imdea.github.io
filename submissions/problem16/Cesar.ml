open Printf
  
let print_list ls =
  let str = String.concat " " (List.map (fun n -> sprintf "%d" n) ls) in
  printf "%s\n" str

let non_leap = [ 0 ; 31 ; 28 ; 31 ; 30 ; 31 ; 30 ; 31 ; 31 ; 30 ; 31 ; 30 ]
let leap     = [ 0 ; 31 ; 29 ; 31 ; 30 ; 31 ; 30 ; 31 ; 31 ; 30 ; 31 ; 30 ]

let fst (x,_) = x
let snd (_,y) = y
  
let shift_non_leap = List.rev (snd (List.fold_left (fun (a,l) x  -> (a+x,(a+x)::l)) (0,[]) non_leap))
let shift_leap =  List.rev (snd (List.fold_left (fun (a,l) x -> (a+x,(a+x)::l))  (0,[]) leap))

let sunday=0
let monday=1
let leap n = if n=1900 then false else ((n mod 4)=0) 
let startnextyear n s = (s+ if leap n then 366 else 365) mod 7
let countsundays ls = List.fold_left (fun x n -> if n=sunday then x+1 else x) 0 ls

let year n s =
  let start_days ls = List.map (fun x -> ((s+x) mod 7)) ls in
  let starts = if leap n then (start_days shift_leap) else start_days shift_non_leap in
  let _ = printf "%d -> " n in
  let _ = print_list starts in 
  countsundays starts

let sol =
  let rec aggregate n s =
    let nexts = startnextyear n s in
    if n=2001 then 0 else year n s + aggregate (n+1) nexts in
  aggregate 1901 (startnextyear 1900 monday)
  

let _ = Printf.printf "%d\n" sol

  
