open Printf
open Scanf

exception Error

let string_of_list ls =
  String.concat "," (List.map string_of_int ls)

let string_of_list ls = String.concat " " (List.map string_of_int ls)
    

let read_one line =
  let stream = (Scanning.from_string line) in
  let rec do_parse acc =
    try
      do_parse (Scanf.bscanf stream " %d " (fun x -> x :: acc))
    with
      Scan_failure _ -> acc
    | End_of_file -> acc
  in List.rev (do_parse [])


type subproblem = {
  ord   : int list;
  ls    : int list;
  depth : int
}
  
let print_stack ls = printf "%s\n" (string_of_list ls)

let print_moves ls = printf "%s\n" (string_of_list (ls@[0]))

  
let printprob p =
  let sord = string_of_list p.ord in
  let sls  = string_of_list p.ls  in
  sprintf "{[%s] : [%s] : %d }" sord sls p.depth

  
let pos ls a =
  let rec find ls n =
    match ls with
      [] -> raise(Error)
    | x::xs -> if a=x then n else find xs (n+1)
  in
  find ls 1

let rev_at_pos p n =
  (* let _ = printf "%s: %s\n" "revatpos" (printprob p) in*)
  let rec aux bs ls c =
    match ls with
      []    -> if c=1 then bs else raise(Error)
    | x::xs -> if c=1 then (List.rev bs)@(List.rev ls) else aux (x::bs) xs (c-1) in
  let newls= aux [] p.ls n in
  { ord=p.ord; ls=newls; depth=p.depth }
      

let mkprob xs ys n = { ord=xs; ls=ys; depth=n }

let max p =
  match p.ord with
    []   -> 0
  | a::_ -> a 

let isempty p = match p with [] -> true | _ -> false

let at_top ls m =
  let rec f ls =
    match ls with
      [] -> false | [a] -> (a=m) | a::xs -> if (a=m) then false else f xs in
  f ls


    
let rec jumpcommon p =
  match (p.ord,p.ls) with
    [],[] -> p
  | x::xs, [] -> raise(Error)
  | [], y::ys -> raise(Error)
  | x::xs, y::ys -> if x=y then jumpcommon (mkprob xs ys (p.depth+1)) else p 

let bringtotop (p,ks) =
  (* let _ = printf "%s: %s\n" "bringtotop" (printprob p) in *)
  let m = max p in
  if m=0 then (p,[])
  else
    let n = pos p.ls m in
    if n=List.length p.ls then (p,ks)
    else
      let newp = rev_at_pos p n in
      (*      let _ = printf "bt: adding [%d]\n" (p.depth+n-1) in *)
      (jumpcommon newp,(p.depth+n-1)::ks)

let swaptfromtop (p,ks) =
  (* let _ = printf "%s: %s\n" "swapfromtop" (printprob p) in *)
  let newp = rev_at_pos p 1 in
  (*  let _ = printf "sw: adding [%d]\n" (p.depth) in*)
  (jumpcommon newp, p.depth::ks)

let nc a b = compare b a
    
let solve ls =
  let ini = { ls=ls; ord=List.sort nc ls; depth=1 } in
  let p = jumpcommon ini in
  let one_step (p,ks) = swaptfromtop (bringtotop (p,ks))  in
  let rec until_solved (p,ks) =
    if isempty p.ls then (p,ks)
    else until_solved (one_step (p,ks)) in
  let (p,ks) = until_solved (p,[]) in
  ks
  

let k = ref 0
    
let sum ls = k:= !k + List.fold_left (+) 0 ls

  
let _ =
  try
    let rec solve_one () =
      let line =Stdlib.read_line () in
      let ls   = read_one line in
      let ks =  solve (List.rev ls) in
      let _ = print_stack ls in
      let _ = print_moves (List.rev ks) in
      sum ls ; sum ks ; solve_one () in
    solve_one ()
  with
    End_of_file ->printf "SOL: %d\n" !k


