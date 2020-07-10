let code s =
  let num_a = Char.code 'A' in
  let tonum c = (Char.code c) - num_a + 1 in
  let rec exp i acc =
    if i < 0 then acc else exp (i - 1) (tonum s.[i]) + acc in
  exp (String.length s - 1) 0


let get_triangles () =
  let triangle n = (n * (n+1)) / 2 in
  let rec aux i l = if i < 0 then l else aux (i-1) ((triangle i)::l) in
  aux 1000 []

let trs = get_triangles ()

let good s =
  let is_in n ls = List.exists (fun x -> x=n) ls in
  is_in (code s) trs

let read_word () =
  let stream = (Scanf.Scanning.from_string (Stdlib.read_line ())) in
  Scanf.bscanf stream "%s" (fun s -> s)

let count = ref 0
    
let _ =
  let rec one () =
    let s = read_word () in
    if (good s) then begin Printf.printf "%s is GOOD\n" s  ; count:=!count +1 end
    else Printf.printf "%s is BAD\n" s
    ; one ()
  in
  try  
    one ()
  with
    End_of_file -> Printf.printf "%n are good\n" !count
