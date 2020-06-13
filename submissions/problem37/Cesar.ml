open Printf

let num_to_list n =
  let rec aux m ls =
    if m=0 then ls else aux (m/10) ((m mod 10)::ls)
  in
  aux n []

let list_to_num l = List.fold_left (fun c x -> c*10+x) 0 l
let sum ls = List.fold_left (+) 0 ls

  
let calc_sums ls =
  let flatten lls = List.map list_to_num lls in
  let concat (n:int) (ls:int list list list) =
    let concatone (l:int list list) : (int list list list) =
      match l with
      | hd::tl -> [ [n]::l ; (n::hd)::tl ]
      | [] -> [[[n]]]
    in
    List.concat (List.map concatone ls) in
  let rec build (ll:int list) : (int list list list) =
    match ll with
      []    -> []
    | [x]   -> [[[x]]]
    | y::tl -> concat y (build tl)
  in
  let good ls = (List.length ls>1) in
  List.map sum (List.map flatten (List.filter good (build ls)))

let max = 1000000  
    
let gen_cands () =
  let rec aux n ls =
    if n > max then ls
    else aux (n+1) ((n,(n*n))::ls)
  in
  aux 1 []

let is_s (n,sq) = List.exists (fun m->m=n) (calc_sums (num_to_list sq))
let sprint_list ls = String.concat " " (List.map string_of_int ls)
  
let _ =
  let ls = gen_cands () in
  let newls = List.filter is_s ls in
  let ns  = List.map (fun (a,b)->a) newls in
  let sqs = List.map (fun (a,b)->b) newls in
  Printf.printf "[%s] [%s] %d\n" (sprint_list ns) (sprint_list sqs) (sum sqs)
