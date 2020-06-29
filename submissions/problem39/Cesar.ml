open Printf

let pow20 = 1048576
let pow19 = 524288

let next prevt =
  let newt = ((615949 * prevt) mod pow20 + 797807 mod pow20) mod pow20 in
  let sk   = newt  - pow19
  in
  (newt,sk)

let nextpair (t,sk) =
  next t

let genall max  =
  let rec get k ls t =
    if k = 0 then ls else
      let (newt,sk) = next t in
      get (k-1) (sk::ls) newt
  in
  get max [] 0

let max = 500500
let nums = Array.of_list (List.rev (genall max))

let some = -153582
  
let findmin v = Array.fold_left (fun n m -> if m<n then m else n) some v
  
   
let upto n = if n = 1 then 1 else ((1 + n)*n)/2

(* must be that j<=i *)
let idx i j = if i=0 then 0 else (upto i) + j
    
let print_list ls =
  List.iter (fun n -> Printf.printf "%d\n" n) ls 

let min = ref some

let calc k vpre vpost tpre tpost =
  let calc_row i =
    for j=0 to (i-k) do
      let n = idx i j in
      tpost.(n)  <- nums.(n)   + tpre.(idx (i-1) j) ;
      vpost.(n)  <- vpre.(n+1) + tpost.(n) ;
      if vpost.(n) < !min then min:= vpost.(n)
    done
  in
  for i=k to 999 do
    calc_row i
  done

let solve () =
  let vpre  = Array.copy nums in
  let tpre  = Array.copy nums in
  let vpost = Array.make (Array.length nums) 0 in
  let tpost = Array.make (Array.length nums) 0 in
  let rec aux i v vp t tp =
    if i>999 then () else
      begin
	calc i v vp t tp ;
	aux (i+1) vp v tp t
      end
  in
  aux 1 vpre vpost tpre tpost
    
let _ =
  let _ = solve () in
  printf "%d\n" !min
  
