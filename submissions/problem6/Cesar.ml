open Printf

let acc = ref 0
 
  
let string_of_list ls =
  String.concat "," (List.map string_of_int ls)

    
let listfromto a b =
  let rec from i = if i=b then [b] else i::(from (i+1)) in
  from a
    
let listn max = listfromto 0 max

let list9 = listn 8
let list1to8 = listfromto 1 8
let list1to9 = listfromto 1 9
let allnodes = listn 80

let char_to_int c = (Char.code c) - (Char.code '0')

let sudoku_to_str a =
  let print_row i = String.concat "" (List.map (fun j->Printf.sprintf "%d" a.(i).(j)) list9) in
  (String.concat "\n" (List.map print_row list9) ) 

let print_sudoku a = printf "%s\n" (sudoku_to_str a)    
  
let parse_one_input () =
  let a = Array.make_matrix 9 9 0 in
  let read_row i = 
    let line = Stdlib.read_line () in
    let stream = (Scanf.Scanning.from_string line) in
    let read_cell j =
      let n = (Scanf.bscanf stream "%c" (char_to_int)) in
      a.(i).(j) <- n in
    List.map read_cell list9
  in
  let _ = List.map read_row list9 in
  a


let rown n = n/9
let coln n = (n mod 9)

let get a n = a.(rown n).(coln n)
let set a n v =
  a.(rown n).(coln n)<-v

let find_missing_value ls =
  let missing n = not (List.exists (fun m->m=n) ls) in
  List.find missing list1to9
    
(** ROWS *)
let get_values_from_row a i =
  List.fold_left (fun s n-> let v = a.(i).(n) in if v!=0 then (v::s) else s) [] list9


      
(** COLUMNS **)
let get_values_from_col a i =
  List.fold_left (fun s n-> let v = a.(n).(i) in if v!=0 then (v::s) else s) [] list9

    
(** BLOCKS *)
type block = {
  a  : int array array;
  ci : int;
  cj : int
}

let get_block ar cn = { a=ar; ci=cn/3; cj=cn mod 3}
  
let get_from_bl b n =
  let i = b.ci*3+(n mod 3) in
  let j = b.cj*3+(n/3) in
  let a = b.a in
  a.(i).(j)

let set_from_bl b n v =
  let i = b.ci*3+(n mod 3) in
  let j = b.cj*3+(n/3) in
  let a = b.a in
  a.(i).(j) <- v
  
let nope str =  ()

let get_values_from_bl bl =
  List.fold_left (fun s n-> let v = (get_from_bl bl n) in if v!=0 then (v::s) else s) [] list9

    
(* SPLIT *)
let remove ls vs =
  let filter ls n = List.filter (fun m->m!=n) ls in
  List.fold_left filter ls vs 
    
let candidates_bl bl = remove (list1to9) (get_values_from_bl bl)

let get_block_from_ij a i j = get_block a ((i/3)*3 + (j/3))
    
let blockn a n = get_block_from_ij a (rown n) (coln n)

let candidates a n =
  if (get a n)!=0 then [] else
    begin
      let cbl  = remove list1to9 (get_values_from_bl (blockn a n)) in
      let crow = remove cbl (get_values_from_row a (rown n)) in
      let ccol = remove crow (get_values_from_col a (coln n)) in
      ccol
    end
      
exception Contradiction
    
let deduce_unit a =
  let deduce_one n =
    if (get a n)!=0 then false
    else
      let cands = (candidates a n) in
      if List.length cands = 1
      then let _ = set a n (List.hd cands) in true
      else if List.length cands = 0 then raise Contradiction
      else false
  in
  let trytodeduce c n = if (deduce_one n) then true else c in
  List.fold_left trytodeduce false allnodes

let smaller_candidate a =
  let noid = 0 in
  let nolist = listn 10 in
  let choose (m,ls) n =
    let cs = candidates a n in
    let l = List.length cs in
    if (l>=1 && l<List.length ls) then (n,cs) else (m,ls) in
  List.fold_left choose (noid,nolist) allnodes

let finished a =
  let known n = ((get a n)!=0) in
  List.for_all known allnodes



let check_list_numbers ls =
  let check_1to9 f = List.fold_left (fun c i -> f i && c) true list1to9 in
  let check i = List.exists (fun n->n=i) ls in
  check_1to9 check
    
let check_solution a =
  let check_idx f = List.fold_left (fun c i -> f i && c) true list9 in
  let check_row i   = check_list_numbers (get_values_from_row a i) in
  let check_col i   = check_list_numbers (get_values_from_col a i) in
  let check_block i =  check_list_numbers  (get_values_from_bl (blockn a i)) in
  (check_idx check_row) && (check_idx check_col) &&  (check_idx check_block)

    
let copy a b = List.iter (fun n -> set b n (get a n)) allnodes
let dup  a =
  let b = Array.make_matrix 9 9 0 in
  let _ = copy a b in
  b

let until f ls=
  let rec next ls =
    match ls with
      [] -> false
    | a::tl -> if (f a) then true else (next tl)
  in
  next ls

let all f ls=
  let rec next ls =
    match ls with
      [] -> false
    | a::tl -> if (f a) then let _ = (next tl) in true else (next tl)
  in
  next ls

    
let solution_number a = (get a 0)*100+ (get a 1)*10 + (get a 2)
    
let rec solve a =
  try 
    if deduce_unit a then solve a
    else if (finished a) then
      if (check_solution a) then 
	let _ = acc:= !acc+ (solution_number a) in
	let _ = (print_sudoku a) and _ = printf "\n" in true
      else false
    else split a
  with
    Contradiction ->  false
and split a =
  let (n,vs) = smaller_candidate a in
  let attempt v =
    let b = dup a in
    let _ = set a n v in
    let res = solve a in
    let _ = copy b a in
    res
  in all attempt vs
  
  
  
  
let parse_input () =
  let line = Stdlib.read_line () in (* eliminate one line "Grid 01" *)
  let _ = printf "%s\n" line in
  let _ = nope line in
  parse_one_input ()
    
    
  
let _ =
  try 
    let rec sudoku () = 
      let a = parse_input () in
      (* let _ = print_sudoku a in *)
      (* let _ = printf "---------\n" in *)
      let _ = solve a in
      sudoku () in
    sudoku ()
  with
    End_of_file -> printf "TOTAL: %d\n" !acc
