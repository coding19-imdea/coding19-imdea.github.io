open Printf
open Scanf
open Scanning
open Int64

let get_line () = Scanf.Scanning.from_string (Stdlib.read_line ())


let solveone () =
  let gt (x:int64) (y:int64) = (Int64.compare x y)>0 in
  let (d,m) = (Scanf.bscanf (get_line ()) "%s %s" (fun x y -> (Int64.of_string x, Int64.of_string y))) in
  let two = 2L in
  let calc sol ub lb = (rem (add sol (mul sol (sub ub lb))) m) in
  let rec aux power sol =
    let next_power = mul two power in
    if (gt next_power d) then (calc sol (add d one)     power)
    else aux next_power  (calc sol (next_power) power)
  in
  (rem (sub (aux one one) one) m)

let ntimes n f =
  let rec onemore k = if k=0 then () else f () ; onemore (k-1) in
  onemore n
  
let _ =
  let n = (Scanf.bscanf (get_line ()) "%s" (fun x -> (int_of_string x))) in
  let f () = Printf.printf "%s\n" (to_string (solveone ())) in
  ntimes n f
