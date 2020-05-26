open Printf
  
let last = ref 199

(* require !last >= n *n *)
let is_prime pr n =
  let rec check ls =
    match ls with
      []   -> printf "ERROR!!" ; true
    | p::tl -> if p*p >n then true else if (n mod p)==0 then false else check tl
  in
  check pr
    

(* returns a list of primes that covers at least n *)    
let more_primes pr n =
  if !last > n then pr
  else
    let upto n =
      let rec newprimes ls m =
	if not (is_prime pr m) then newprimes ls (m+2)
	else
	  let newls = m::ls in
	  if m > n then newls
	  else newprimes (m::ls) (m+2) 
      in
      let newpr = newprimes [] (!last+2) in
      let _ = last:= List.hd newpr in
      pr @ (List.rev newpr)
    in
    upto n
	

let next_prime pr n =
  let rec aux m =
    if is_prime pr m then m else aux (m+1)
  in
  aux (n+1)
    

let print_list ls =
  let str = String.concat " " (List.map (fun n -> sprintf "%d" n) ls) in
  printf "%d\n[%s]\n" (List.length ls) str





let m = 1234567891011
let add_mod x y = ((x mod m) + (y mod m)) mod m
let sub_mod x y = (( ((x mod m) + m) - (y mod m)) mod m)
let rec mul_mod x y =
  if y = 0 then 0
  else if y=1 then x
  else if (y mod 2)=0 then
    (2 * (mul_mod x (y/2) mod m)) mod m
  else
    add_mod x (mul_mod x (y-1))
let rec myfib i =
  if i=0 then (0,1)
  else
    let (a,b) = myfib (i / 2) in
    let c = mul_mod a (sub_mod (b * 2 + m) a) in
    let d = add_mod (mul_mod a a) (mul_mod b b) in
    if (i mod 2) = 0  then (c,d) else (d,add_mod c d)
      
let fast_fib n = let (fn,fnplusone) = myfib n in fn
  

let sol pr =
  let rec aux acc n i =
    if n>100000 then acc else
      let _ = if (i mod 10001) = 0 then printf "trying %d (n=%d)\n" i n ; flush_all () in
      if (is_prime pr i) then
	(aux (add_mod acc (fast_fib i)) (n+1) (i+2))
      else
	(aux acc n (i+2))
  in
  aux 0 1 100000000000001
      
let _ =
  let early_primes = [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31;
		      37; 41; 43; 47; 53; 59; 61; 67; 71; 73;
		      79; 83; 89; 97; 101; 103; 107; 109; 113;
		      127; 131; 137; 139; 149; 151; 157; 163;
		      167; 173; 179; 181; 191; 193; 197; 199 ] in
  let _ = last:=199 in
  let _ = printf "A\n" ; flush_all () in
  let prs = more_primes early_primes 10000 in
  let _ = printf "B\n" ; flush_all ()in
  let prs = more_primes prs 20000000 in
  let _ = printf "C\n" ; flush_all () in
  let s = sol prs  in
  printf "%d\n" s
  
