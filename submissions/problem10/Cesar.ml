open Printf
  
type box = { diamond: int; gold: int; money: int }

let create_box d g m = { diamond=d; gold=g; money=m }

let boxes = Array.make 3 {diamond=0;gold=0;money=0}

let setbox b i = Array.set boxes i b

let gold i    =  boxes.((i+1) mod 3).gold    +   boxes.((i+2) mod 3).gold 
let diamond i =  boxes.((i+1) mod 3).diamond +   boxes.((i+2) mod 3).diamond
let money i   =  boxes.((i+1) mod 3).money   +   boxes.((i+2) mod 3).money

let min x y = if x<y then x else y
  
let sol () : int =
  let n =        gold 0 + diamond 1 + money 2 in
  let n = min n (gold 0 + diamond 2 + money 1) in
  let n = min n (gold 1 + diamond 0 + money 2) in
  let n = min n (gold 1 + diamond 2 + money 0) in
  let n = min n (gold 2 + diamond 0 + money 1) in
  let n = min n (gold 2 + diamond 1 + money 0) in
  n
  
    
    
    
let _ =
  let stream = (Scanf.Scanning.from_string (Stdlib.read_line ())) in
  let b1=Scanf.bscanf stream " %d %d %d" (fun d g m -> create_box d g m) in
  let b2=Scanf.bscanf stream " %d %d %d" (fun d g m -> create_box d g m) in
  let b3=Scanf.bscanf stream " %d %d %d" (fun d g m -> create_box d g m) in
  let _ = setbox b1 0 in
  let _ = setbox b2 1 in
  let _ = setbox b3 2 in
  printf "%d\n" (sol ())
