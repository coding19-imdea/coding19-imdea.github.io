open Printf


  
let printcode s =
  printf "(%d,%d,%d %d,%d,%d %d,%d,%d %d,%d,%d %d,%d,%d) -> %d\n"
    s.(0) s.(1) s.(2) 
    s.(3) s.(2) s.(4) 
    s.(5) s.(4) s.(6) 
    s.(7) s.(6) s.(8) 
    s.(9) s.(8) s.(1)
    (s.(0) + s.(1) + s.(2))

let legal s =
  let one = s.(0) + s.(1) + s.(2) in
  let two = s.(3) + s.(2) + s.(4) in
  let three = s.(5) + s.(4) + s.(6) in
  let four = s.(7) + s.(6) + s.(8) in
  let five = s.(9) + s.(8) + s.(1) in
  one = two && one = three && one = four && one = five


let soltostring s =
  let one   = sprintf "%d%d%d" s.(0)  s.(1)  s.(2) in
  let two   = sprintf "%d%d%d" s.(3)  s.(2)  s.(4) in
  let three = sprintf "%d%d%d" s.(5)  s.(4)  s.(6) in
  let four  = sprintf "%d%d%d" s.(7)  s.(6)  s.(8) in
  let five  = sprintf "%d%d%d" s.(9)  s.(8)  s.(1) in
  if      s.(3) < s.(5) && s.(3) < s.(7) && s.(3) < s.(9) then
    sprintf "%s%s%s%s%s" two three four five one
  else if s.(5) < s.(3) && s.(5) < s.(7) && s.(5) < s.(9) then
    sprintf "%s%s%s%s%s" three four five one two
  else if s.(7) < s.(3) && s.(7) < s.(5) && s.(7) < s.(9) then
    sprintf "%s%s%s%s%s"  four five one two three
  else (* if s.(9) < s.(3) && s.(9) < s.(5) && s.(9) < s.(7)  then *)
    sprintf "%s%s%s%s%s" five one two three four

let print s = printf "%s\n" (soltostring s)

let best = ref ""
  
let add s =
  if legal s then
    let str = soltostring s in
    if  compare str !best>0 then best:=str
    
let doit () =
  let sol = Array.make 10 0 in
  let _ = Array.set sol 0 10 in
  let rec solve i =
    let trythis k =
      if sol.(k)=0 then  begin Array.set sol k i ; solve (i+1) ; Array.set sol k 0 end in
    if i=10 then add sol
    else for k=1 to 9 do trythis k done in
  solve 1

let _ =
  doit () ; printf "%s\n" !best


    
