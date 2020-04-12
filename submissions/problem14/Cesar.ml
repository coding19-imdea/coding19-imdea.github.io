open Printf
open Array

let coord c = let (x,_)=c in x
let breed c = let (_,b)=c in b

let same c1 c2 = (breed c1)=(breed c2)

(* INPUT/OUTPUT *)  
let read_cow () =
  let stream = (Scanf.Scanning.from_string (Stdlib.read_line ())) in
  Scanf.bscanf stream "%d %c" (fun x c -> (x,c))

let pr_cow c = printf "%d %c\n" (coord c) (breed c)
let rec print_cows cows =
  match cows with
    [] -> ()
  | c::tl -> pr_cow c ; print_cows tl

type stretch = { s: int ; w:int; dist:int }

let ss c = if (breed c) ='S' then 1 else 0
let ws c = if (breed c) ='W' then 1 else 0

let best=ref 0
let start=ref 0
let width=ref 0
let sol_ws=ref 0
let sol_ss=ref 0

let printst i st =
  match st with
     None -> ()
  |  Some e -> printf "%d { s:%d; w:%d; dist:%d}\n" i e.s e.w e.dist

let distance table i j = (coord table.(j)) - (coord table.(i)) 
    
let calc_same table =
  let n = length table in
  let sol = make n 0 in
  let hops i =
    let c = breed table.(i) in
    let rec cont k = if k=n then k-1 else if (breed table.(k)!=c) then k-1 else cont (k+1) in
    cont i in
  for i=0 to n-1 do
    set sol i (hops i)
  done ; sol

let calc_sol table i j =
  let d=distance table i j in
  if (d > !best) then begin best:=d ; start:=i; width:=j-i end

let distmax_same table hop =
  let n= length table in
  for i=0 to n-1 do calc_sol table i hop.(i) done

let maxtable = Hashtbl.create 100000    

let calc_max_stretches table =
  let n = length table in
  let fst = table.(0) in
  let balfst = ss fst - ws fst in
  let acc = make (n+1) 0 in
  let rec calc i bal =
    let newbal = bal + (ss table.(i) - ws table.(i)) in
    Hashtbl.replace maxtable newbal (coord table.(i)) ;
    set acc i bal ;
    if i<(length table)-1 then calc (i+1) newbal
  in
  set acc 0 balfst ;
  calc 0 0 ;
  acc
    
let solve_compensated table =
  let acc = calc_max_stretches table in
  let solve i =
    let ci=coord table.(i) in
    let diff = acc.(i) - acc.(0) in
    if Hashtbl.mem maxtable diff then
      let cx = Hashtbl.find maxtable diff in
      if (cx - ci) > !best then
	(* let _ = printf "setting best to %d at %d\n" (cx - ci) i in*)
	best:=(cx - ci) ; start:=i in
  for i=0 to (length table)-1 do
    solve i
  done
    
let next_stretch k table prev =
  let n = length table in
  let sol = make (n+1) None in
  let distn i = (coord table.(i+1)) - (coord table.(i)) in
  let set_best x i =
    let _ = pr_cow table.(i) in
    start:=i ; width:=k ; sol_ws:=x.w; sol_ss:=x.s;
    best:=x.dist ;
    printf "%d (i:%d, width:%d, w:%d, s:%d\n)" !best !start !width !sol_ws !sol_ss
  in
  let is_sol e i =
    (* let _ = printst i (Some e) in *)
    if (e.dist> !best && (e.s=0 || e.w=0 || e.s=e.w)) then set_best e i in
  let calc i =
    let me = table.(i) in
    if (i+k+1)>(n-1) then None
    else
      let e = match prev.(i+1) with
	  None ->  {s=ss me;w=ws me;dist=0}
	| Some succ -> { s=succ.s + (ss me); w=succ.w + (ws me); dist=succ.dist + distn i } in
      let _ = is_sol e i in
      Some e in
  for i=0 to n-(k+1) do
    set sol i (calc i)
  done ; sol


let list2table ls =
  let n = List.length ls in
  let table=make n (0,'A') in
  let _ =  List.fold_left (fun i e->set table i e ; i+1) 0 ls in
  table
   
    
let _ =
  let n = Stdlib.read_int () in
  let rec read_input i ls =
    if i=0 then ls else
      read_input (i-1) (read_cow()::ls) in
  let cows = read_input n [] in
  let compare c1 c2 =
    let (x1,_)=c1 and (x2,_)=c2 in if x1=x2 then 0 else if x1<x2 then -1 else 1 in
  let ord = List.sort compare cows in
  let table = (list2table ord) in
  (* let hop = calc_same table in *)
  (* let _ = distmax_same table hop in *)
  let _ = solve_compensated table in
  printf "%d\n" !best 
(*  printf "%d (i:%d, width:%d)\n" !best !start !width *)
(* let _ = solve ord in *)
(* printf "%d (i:%d, width:%d, w:%d, s:%d\n)" !best !start !width !sol_ws !sol_ss *)
  
      
