type entry = {
  i : int;
  xyz : int array;
}

let inc e = {i=e.i+1; xyz=e.xyz}
let top e = (e.xyz).(e.i)
let empty e= (e.i>=3)
 

let rec elim_rep ls =
  let eq v w =
    let a = v.xyz and b = w.xyz in
    (a.(0)=b.(0) && a.(1)=b.(1) && a.(2)=b.(2)) in
  match ls with
    [] -> []
  | a::tl ->
    if (List.exists (fun x-> eq a x) tl) then elim_rep tl
    else a::(elim_rep tl)

let rec harder_eq a b =
  if empty b then true
  else if empty a then false
  else if (top a)=(top b) then harder_eq (inc a) (inc b)
  else harder_eq (inc a) b

let eq a b =
  let rec eqi i = if (i>3) then true else (a.xyz).(i)=(b.xyz).(i) &&  eqi (i+1)
  in
  if a.i = b.i then eqi a.i else false

let rec harder a b = (harder_eq a b) && (not (eq a b))


      
    
let print e =
  let rec pr i = if i>=3 then "" else (string_of_int (e.xyz).(i)) ^ (pr (i+1))
  in
  pr e.i

    
let printer ls =
  let print_one e = Printf.printf "%s\n" (print e) in
  List.iter print_one ls


    
let print_list_num cs =
  let _ = List.iter (fun n -> Printf.printf "%d" n) cs in
  let _ = Printf.printf "\n" in
  ()

let print_candidates = print_list_num
  
let print_case ls =
  let print_one v =
    let xyz = v.xyz in
    Printf.printf "%d%d%d\n" xyz.(0) xyz.(1) xyz.(2) in
  List.iter print_one ls
    

  
let rec simplify ls =
  let rec simplify_fwd rest =
    let goes x xs = List.exists (fun a -> harder_eq a x) xs in
    match rest with
      [] -> []
    | hd::tl -> if goes hd tl then (simplify_fwd tl) else hd::(simplify_fwd tl)
  in
  let rec simplify_bkd bf af =
    match af with
      [] -> List.rev bf
    | hd::tl ->
      if (List.exists (fun a -> harder a hd) bf) then (simplify_bkd bf tl)
      else (simplify_bkd (hd::bf) tl) in
  simplify_bkd [] (simplify_fwd ls)  


let candidates ls =
  let rec cand_one xs e =
    if e.i>=2 then xs
    else if e.i=1 then
      (*       let _ =   if (e.xyz).(1)=3 then Printf.printf "%s -> 3\n" (print e) in *)
      ((e.xyz).(1))::xs
    else
      (* let _ = if (e.xyz).(0)=3 then Printf.printf "%s -> 3\n" (print e) in *)
      (* (e.xyz).(0)::(e.xyz).(1)::xs *)
      (e.xyz).(0)::xs 
  in
  let rec nonrep ls =
    match ls with
      [] -> []
    | hd::tl -> if (List.exists (fun x -> x=hd) tl) then (nonrep tl) else hd::(nonrep tl)
  in
  nonrep (List.fold_left cand_one [] ls)

let resid ls n =
  let resid_one n e = if (top e)=n then
      begin
	(*Printf.printf "simplifying %s" (print e) ; *)
	let newe = inc e  in
	(*Printf.printf " into %s\n" (print newe) ;*)
	newe
      end
    else e in
  List.map (resid_one n) ls
  

let max  = ref 9

let pairs xs =  List.fold_left (fun n e -> if empty e then n else n+1) 0 xs
let numbers xs =  List.fold_left (fun n e -> n+(3-e.i)) 0 xs

let singletons xs = List.for_all (fun e -> e.i>=2)  xs
let get_nums xs = List.map (fun e -> (e.xyz).(2)) xs
  
let rec solve ls =
  let rec step d ns xs =
    let cs = candidates xs in
    (*    let _ = Printf.printf "%d:(%d,%d)\n" d (pairs xs) (numbers xs) in *)
    (*    let _ = Printf.printf "(%d,max:%d)\n" d !max in *)
    if d >= !max then !max
    else match ls with
      [] -> max:=d ; Printf.printf "found %d\n" d ; d 
    | _ ->
      if singletons xs then
	let _ = if (d+List.length xs < !max) then
	    begin
	      max:=d+List.length xs ; Printf.printf "found %d\n" !max ;
	      print_list_num (List.rev ((get_nums xs) @ ns))
	    end
	in
	!max
      else
	let f n =
	step (d+1) (n::ns) (simplify (resid xs n)) in
      let min x y = if x<y then x else y in
      List.fold_left (fun m n -> min m (f n)) d cs in
  step 0 [] ls


    
let parse_entry n =
  let z = n mod 10 in
  let y = (n/10) mod 10 in
  let x = (n/100) mod 19 in
  { i=0 ; xyz = [| x ; y ; z |] }

exception Error

let _ =
  let rec read_input ls =
    let n = Stdlib.read_int () in
    try
      read_input (n::ls)
    with
      End_of_file -> (List.rev (n::ls))
  in
  let ls = read_input [] in
  let input = List.map parse_entry ls in
  solve (simplify input)
    
