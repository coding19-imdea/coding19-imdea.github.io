open Stdlib
open Printf


(* if gcd(m,n)=1 then phi(mn) = phi(m)*phi(n) *)
(* if p is prime then phi(p)=p-1 *)
(* if p is prime then phi(p^k)=(p-1)*p^(k-1) *)


let rec gcd a b = if b = 0 then a else gcd b (a mod b)

let phi p k =
  let rec ppower n = if n=0 then 1 else if n=1 then p else p*(ppower (n-1)) in
  (p-1) * ppower(k-1)

let decompose n =
  let rec reduce a b = if (a mod b=0) then (reduce (a/b) b) else a in
  let rec times a b = if (a mod b=0) then 1+(times (a/b) b) else 0 in
  let rec aux c p =
    if p = 1 then []
    else if p < c*c then [(p,1)]
    else if p mod c = 0 then (c, times p c)::(aux c (reduce p c))
    else aux (c+1) p
  in
  aux 2 n
let phi n =
  let mul a b = a * b in
  let primes = decompose n in
  let phis   = List.map (fun (p,k) -> phi p k) primes in
  List.fold_left mul 1 phis

let max  = ref 0
let best = ref 0
  
let solve () =
  for i=2 to 1000000 do
    let v=(1000000*i)/(phi i) in
    if v > !max then
      begin
	max:=v;
	best:=i
      end
  done
  
let _ =
  let _ = solve () in
  printf "%d -> %d\n" !best !max
