open Printf
open Scanf
open Scanning

let print_list ls =
  let str = String.concat " " (List.map (fun n -> sprintf "%d" n) ls) in
  printf "%d\n%s\n" (List.length ls) str

let id x = x

let read_input n =
  let rec read_nums m ls =
    if m=0 then ls
    else
      let x = bscanf stdin " %d" id in
      (* let _ = printf "Read %d, missing %d nums.\n" x m in *)
      read_nums (m-1) (x::ls)
  in
  List.rev (read_nums n [])


let one_day ls =
  let rec aux a bf af =
    match af with
      []    -> bf
    | x::xs ->
      let newbf=
	if a>x then
	  (* let _ =printf "%d not removed\n" x in *)
	  x::bf
	else
	  (*	  let _ =printf "%d removed\n" x in*)
	  bf
      in
      (aux x newbf xs)
  in
  match ls with [] -> [] | x::xs -> x::(List.rev (aux x [] xs))

let solve ls =
  let rec aux n ls =
    let next = one_day ls in
    (* let _ = print_list next in*)
    if (List.length next)=(List.length ls) then n else aux (n+1) next
  in
  aux 0 ls
    
let _ =
  let n =bscanf stdin "%d" id in
  let ls=read_input n in
  let sol = solve ls in
  printf "%d\n" sol
