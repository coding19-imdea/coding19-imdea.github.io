open Printf
open Array
open Scanf
open Scanning
open Int64

let get_line () = Scanf.Scanning.from_string (Stdlib.read_line ())

let bit_differ l r =
  let bit x b = logand x (shift_left one b) in
  let rec find i = if (i=0 || not(equal (bit l i) (bit r i))) then i else find (i-1) in
  find 63

let fill n =
  let rec aux i acc = if i>n then acc else aux (i+1) (logor acc (shift_left one i)) in
  if n=0 then zero else  aux 0 zero

let pr x = Printf.printf "%s\n" (to_string x)
                
let _ =
  let (l,r) = (Scanf.bscanf (get_line ()) "%s %s" (fun x y -> (Int64.of_string x, Int64.of_string y))) in
  let sol = fill (bit_differ l r) in
  Printf.printf "%s\n" (to_string sol)

