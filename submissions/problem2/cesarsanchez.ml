
(* METHOD 1 *)
let values = [| 200; 100; 50 ; 20; 10; 5; 2; 1 |]

let sol n =
  let rec solaux left n =
    let me = values.(n) in
    if left=0 then 1
    else if values.(n)=1 then 1
    else if me=left then
      1 + (solaux left (n+1))
    else if me < left then
      (solaux (left - me) n) + (solaux left (n+1))
    else (solaux left (n+1))
  in
  solaux n

(* METHOD 2 *)
let vs = [ 200; 100; 50 ; 20; 10; 5; 2; 1 ]

let rec sol2 n =
  let rec solaux left vals =
    match vals with
      []    -> 0
    | v::ls ->
    (* let _ = Printf.printf "sol2 %d [%d...]\n" left v in *)
      if v=left then 1 + (solaux left ls)
      else if v<left then (solaux (left-v) vals) + (solaux left ls)
      else (solaux left ls)
  in
  solaux n
     
  
let printn ls n =
  List.iter (fun d -> Printf.printf "%d " d) ls;
  for i=0 to n do Printf.printf "1 " done ;
  Printf.printf "\n"
    
let _ =
  (* let n = (int_of_string Sys.argv.(1)) in *)
  (* Printf.printf "%d -> %d, %d\n" n (sol n 0) (sol2 n vs) *)
  Printf.printf "%d\n" (sol 200 0)

    
