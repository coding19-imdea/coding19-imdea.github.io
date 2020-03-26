
let combs   = Hashtbl.create 1024
let cancel  = Hashtbl.create 1024

let combines a b = Hashtbl.find_opt combs (a^b)

let cancels a b = Hashtbl.mem  cancel (a^b)

let isexplode ls =
  let check a rest = List.exists (cancels a) rest in
  match ls with
    []     -> false
  | hd::tl -> check hd tl

let explode ls =
  if (isexplode ls) then []
  else ls
  
let eval ls =
  let evalone pop v =
    match pop with
      [] -> [v]
    | hd::tl ->
      match (combines v hd) with
	None   -> explode (v::pop)
      | Some x -> explode (x::tl)
  in
  List.fold_left evalone [] ls

let trial () =
  let _ = Hashtbl.clear combs in
  let _ = Hashtbl.clear cancel in
  let c2str c = String.make 1 c in
  let line = Stdlib.read_line () in
  let stream = (Scanf.Scanning.from_string line) in
  let c = Scanf.bscanf stream "%d" (fun x -> x) in
  let _ = for i=1 to c do
      let x,y,z = Scanf.bscanf stream " %c%c%c" (fun x y z -> (c2str x,c2str y,c2str z)) in
      Hashtbl.add combs (x^y) z ; Hashtbl.add combs (y^x) z 
    done in
  let d = Scanf.bscanf stream " %d" (fun x -> x) in
  let _ = for i=1 to d do
      let x,y = Scanf.bscanf stream " %c%c" (fun x y -> (c2str x,c2str y)) in
      Hashtbl.add cancel (x^y) true  ; Hashtbl.add cancel (y^x) true
    done in
  let n = Scanf.bscanf stream " %d" (fun x -> x) in
  let str = Scanf.bscanf stream " %s" (fun x -> x) in
  let _ = (n = String.length str) in
  let ls = List.map c2str (List.init (String.length str) (String.get str)) in
  eval ls

let print ls =
  Printf.sprintf "[" ^ (String.concat "," (List.rev ls)) ^ "]"
    
let _ =
  let count = ref 0 in
  let line = Stdlib.read_line () in
  let trials = int_of_string line in
  for i=1 to trials do
    let ret = trial () in
      count := !count + (List.length ret) ;
      Printf.printf "Case #%d: %s\n" i (print  ret)
  done ;
  Printf.printf "%d\n" !count
  

