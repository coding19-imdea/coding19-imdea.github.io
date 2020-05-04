open Printf

type point = { x:int; y:int }

let sign (p1:point)  (p2:point) (p3:point) : int =
  let a = ((p1.x - p3.x) * (p2.y - p3.y)) in
  let b = ((p2.x - p3.x) * (p1.y - p3.y)) in
  (a - b)


let in_triangle pt v1 v2 v3 =
  let d1 = sign pt v1 v2 in
  let d2 = sign pt v2 v3 in
  let d3 = sign pt v3 v1 in
  let has_neg = (d1<0) || (d2<0) || (d3<0) in
  let has_pos = (d1>0) || (d2>0) || (d3>0) in
  not (has_neg && has_pos)



let count = ref 0
let total = ref 0
    
let process_triangle () =
  let read_triangle () =
    let stream = (Scanf.Scanning.from_string (Stdlib.read_line ())) in
    Scanf.bscanf stream "%d,%d,%d,%d,%d,%d"
      (fun p1x p1y p2x p2y p3x p3y -> ({x=p1x;y=p1y}, {x=p2x;y=p2y}, {x=p3x;y=p3y})) in
  let (v1,v2,v3)=read_triangle () in
  let zero = {y=0 ; x=0} in
  let _ = total:=!total+1 in
  if in_triangle zero v1 v2 v3 then  count := !count +1
  
let _ =
  let rec doit () = process_triangle () ; doit () in
  try
    doit ()
  with
    _ -> printf "total:%d count:%d\n" !total !count
  
