open Printf

let triangle   n = n * (n+1) / 2
let square     n = n * n
let pentagonal n = n * ( 3 * n - 1) / 2
let hexagonal  n = n * (2 * n - 1)
let heptagonal n = n * ( 5 * n - 3)/2
let octagonal  n = n * ( 3 * n - 2)

let get_all f =
  let rec aux i ls =
    let x = f i in
    if x > 9999 then ls
    else if x < 1000 then aux (i+1) ls
    (* else if x < 0 then aux (i+1) ls *)
    else aux (i+1) (x::ls)
  in
  aux 1 []

  
let ls3 = get_all triangle 
let ls4 = get_all square 
let ls5 = get_all pentagonal 
let ls6 = get_all hexagonal 
let ls7 = get_all heptagonal 
let ls8 = get_all octagonal 

let gen f n =
  let rec aux k =
    let m = f k in
    if m>9999 then -1
    else if m = n then k else aux (k+1)
  in
  aux 1

  
let getnum n =
  if      List.mem n ls3 then 3
  else if List.mem n ls4 then 4
  else if List.mem n ls5 then 5
  else if List.mem n ls6 then 6
  else if List.mem n ls7 then 7
  else if List.mem n ls8 then 8
  else 666

let getnums n =
  let check l k = if List.mem n l then [k] else [] in
  let n3 = check ls3 3 in
  let n4 = check ls4 4 in
  let n5 = check ls5 5 in
  let n6 = check ls6 6 in
  let n7 = check ls7 7 in
  let n8 = check ls8 8 in
  List.concat [ n3 ; n4 ; n5 ; n6 ; n7 ; n8 ]
    
type table = (int,int list) Hashtbl.t

let isin tab n = Hashtbl.mem tab n
let find tab n = if not (isin tab n) then [] else (Hashtbl.find tab n)
let add tab n =
  let ls:(int list) = if isin tab (n/100) then find tab (n/100) else [] in
  Hashtbl.add tab (n/100) (n::ls)
  
let list_to_table ls =
  let tab:table = Hashtbl.create 100 in
  let myadd n = add tab n in
  let _ = List.iter myadd ls in
  tab
  


module SInt = Set.Make(Int)
    
let reachable tbls s =
  let next tab n =
    let d = (n mod 100) in
    List.fold_left (fun s n->SInt.add n s) SInt.empty (find tab d)
  in
  match tbls with
    [] -> s
  | tab::tl ->
    let ns = SInt.elements s in
    List.fold_left (fun r n -> SInt.union (next tab n) r) SInt.empty ns


let rec reachable tbls lls =
  let next tab ls =
    match ls with [] -> printf "ERROR!\n" ; []
    | n::tl -> List.map (fun x-> x::ls) (find tab (n mod 100))
  in
  match tbls with
    [] -> lls
  | tab::tl -> reachable tl (List.concat (List.map (fun ls -> next tab ls) lls))

let find_def f d ls =
  match List.find_opt f ls with
    None   -> d
  | Some x -> x
    
let solve n tbls =
  let find ls =
    match ls with
      [] -> false
    | hd::_ -> if (hd mod 100)=(n/100) then true else false
  in
  let lls = reachable tbls [[n]] in
  List.filter find lls 
(* find_def find [] lls *)
	
let rec interleave x lst = 
  match lst with
  | [] -> [[x]]
  | hd::tl -> (x::lst) :: (List.map (fun y -> hd::y) (interleave x tl))

let rec permutations lst = 
  match lst with
  | hd::tl -> List.concat (List.map (interleave hd) (permutations tl))
  | _ -> [lst]


let solve_one_perm ls tbls =
  let rec tryone ls =
    match ls with
      [] ->  []
    | n::tl -> match solve n tbls with [] -> tryone tl | sol -> sol@(tryone tl)
  in
  tryone ls

let solve_all ls perms =
  let rec tryone ps =
    match ps with
      [] ->  []
    | p::tl -> match solve_one_perm ls p with [] -> tryone tl | sol -> sol@(tryone tl)
  in
  tryone perms

let print_list ls =
  let str_nums n = String.concat "," (List.map string_of_int (getnums n)) in
  let str = String.concat " " (List.map (fun n -> sprintf "%d:(%s)" n (str_nums n)) ls) in
  printf "%s\n" str
    
let _ =
  let tab3 = list_to_table ls3 in
  let tab4 = list_to_table ls4 in
  let tab5 = list_to_table ls5 in
  let tab6 = list_to_table ls6 in
  let tab7 = list_to_table ls7 in
  let tab8 = list_to_table ls8 in
  let perms = permutations [tab3 ; tab4 ; tab5; tab6 ; tab8] in
  let sol = solve_all ls7 perms in
  let _ = List.iter print_list sol in
  List.iter (fun s -> printf "sum: %d\n" (List.fold_left (+) 0 s)) sol
    
