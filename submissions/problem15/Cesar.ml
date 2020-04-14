open Printf
  
exception Error
  
let init = [| 0 ; 0 ; 0 ; 10 |]

let sols = Hashtbl.create 500000
let mem d left = Hashtbl.mem sols (d,left)
let find d left = Hashtbl.find sols (d,left)
let set d left s = Hashtbl.replace sols (d,left) s

let use a i =
  if a.(i)=0 || i=0 then raise Error else
    let ai = a.(i) and am=a.(i-1) in
    Array.set a (i-1) (am+1) ; Array.set a i (ai-1)

let copy_use a i = let b = Array.copy a in use b i ; b
      
let rec memocount d left =
  if mem d left  then find d left
  else let s = count d left in
       set d left s ; s
and count d left =
  if d=0 then 1 else
    let n3 = left.(3) and n2=left.(2) and n1=left.(1) in
    let s3 = if n3>0 then (memocount (d-1) (copy_use left 3)) else 0 in
    let s2 = if n2>0 then (memocount (d-1) (copy_use left 2)) else 0 in
    let s1 = if n1>0 then (memocount (d-1) (copy_use left 1)) else 0 in
    n3 * s3 + n2 * s2 + n1 * s1

let sol () =
  let left = Array.copy init in
  let _ = use left 3 in
  9 * (memocount 17 left) 


let _ =
  printf "%d\n" (sol ())
