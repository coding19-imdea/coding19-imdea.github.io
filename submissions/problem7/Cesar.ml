open Printf

let c = ref 0

let is_odd n =
  let rec one_odd n =
    if ((n mod 10) mod 2)=0 then false
    else ((n/10)=0 || one_odd (n/10))
  in
  one_odd n
  
let is_rev n =
  let rec rev a b =
    let n = b*10+(a mod 10) in
    let m = a/10 in
    if m>0 then rev m n else n
  in
  if (n mod 10)=0 then ()
  else  
  if (is_odd (n + (rev n 0))) then
    let _ = printf "%d\n" n in
    c:=!c+1


    
let solve k =
    for i=1 to k do
      is_rev i
    done

let _ =
  solve (1000*1000*1000)  
  (*  solve 1000*)
  ; printf "Total: %d\n" !c
