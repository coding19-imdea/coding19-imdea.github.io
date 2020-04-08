open Printf

let bitone n = 1 lsl n
let get m i = (m land (bitone i)) lsr i
let set m i = (m lor (bitone i))
let unset m i = (m land (lnot (bitone i)))
let getid a b c d e f =a+2*(b+2*(c+2*(d+2*(e+2*f))))

let listfromto a b =
  let rec from i = if i=b then [b] else i::(from (i+1)) in
  from a
    
let listn max = listfromto 0 max
let list6 = listn 5     

let sprintsp n = (String.make n ' ')

type memo_tb = ((int*int*int),int) Hashtbl.t


let solve n =
  let memo:memo_tb=Hashtbl.create 10000 in
  let isin n prev last = Hashtbl.mem memo (n,prev,last) in
  let find n prev last = Hashtbl.find memo (n,prev,last) in
  let add n prev last v = Hashtbl.add memo (n,prev,last) v in
  let rec calc n prev last =
    if (isin n prev last) then (find n prev last)
    else
      (*      let _ = printf "calc %d %d %d\n" n prev last in*)
      if n=1 then 1 + (if (prev=0 && last=0) then 1 else 0)
      else
	let zero = (calc (n-1) 0 last) in
	let ones = (if prev=0 then (calc (n-1) 1 last) else 0) in
	let sol = zero+ones in
	(add n prev last sol) ;
	sol
  in
  if n=1 then 1 else
    calc (n-1) 0 0 + calc (n-1) 1 1
  
  

let sprint m = String.concat "" (List.map (fun i -> if (get m i)=1 then "1" else "0") list6)
  
let print m = printf "%s" (sprint m)


let next m =
  let a=get m 0 in
  let b=get m 1 in
  let c=get m 2 in
  let d=get m 3 in
  let e=get m 4 in
  let f=get m 5  in 
  let newf = (a lxor (b land c)) in
  getid b c d e f newf

let prev m =
  let b=get m 0 in
  let c=get m 1 in
  let d=get m 2 in
  let e=get m 3 in
  let f=get m 4 in
  let g=get m 5 in
  let newa = (g lxor (b land c)) in
  getid newa b c d e f

let isin n ls = List.exists (fun k -> k=n) ls    


module NSet=Set.Make(Int)
  
let chain m =
  let rec aux n ls =
    if isin n ls then ls
    else if prev (next n)!=n then
      let _ = printf "error %s->%s<-%s\n" (sprint n) (sprint (next n)) (sprint (prev n))  in
      ls
    else
      aux (next n) (n::ls) in
  aux m [] 

let print_chain ls =
  printf "%d: %s" (List.length ls) (String.concat "," (List.map (fun n -> sprint n) ls))

let used = ref NSet.empty

let n=ref 1
  
let _ =
  (* printf "%d\n" (solve ()) *)
  for i=0 to 63 do
    if (NSet.mem i !used) then () else
      let ls = chain i in
      n := !n*(solve (List.length ls)) ;
      List.iter (fun x-> (used:=(NSet.add x !used))) ls
  (* print_chain (chain i) ; printf "\n" *)
  done ;
  printf "%d\n" !n

    
  
