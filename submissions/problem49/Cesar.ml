open Printf
open Array
open Scanf
open Scanning   

module NSet=Set.Make(Int)
   
let get_line () = Scanf.Scanning.from_string (Stdlib.read_line ())
          
let print_nset ss =
  let els = NSet.elements ss in
  let _ = List.iter (fun i -> Printf.printf "%d " i) els in
  Printf.printf "\n"
  

let array_filter (arr:'a Array.t) (f:'a -> bool) =
  let filt (id,res) a = if f a then (id+1,id::res) else (id+1,res) in
  let (_,res) =  Array.fold_left filt (0,[]) arr in
  res

let setn n =
  let rec firstn i ls = if i=0 then i::ls else firstn (i-1) (i::ls) in
  NSet.of_list (firstn n [])
  
let get_rings adj : NSet.t =
  let ar:(int array) = Array.map (fun xs -> List.length xs) adj in 
  let rec step ls rem =
    let subst n =
      ar.(n) <- ar.(n) -1 ; ar.(n) = 1
    in
    match ls with
      []     -> rem
    | n::tl  ->
       let newrem   = NSet.remove n rem in
       let newnodes = List.filter subst (adj.(n)) in
       step (newnodes@tl) newrem
  in
  let initns   = array_filter ar (fun i -> i = 1) in
  let allnodes = setn (Array.length adj-1) in
  step initns allnodes

  
let split_rings rings adj =
  let rec step n sol this rem =
    let newrem = NSet.remove n rem in
    let isnext m = (NSet.mem m rings && not(NSet.mem m this)) in
    match (List.find_opt isnext adj.(n)) with
      None   ->
       let newsol = this::sol in
       begin
         match NSet.choose_opt newrem with
           None   -> newsol
         | Some m -> step m newsol (NSet.singleton m) newrem
       end
    | Some m -> step m sol (NSet.add m this) newrem
  in
  let n = (NSet.choose rings) in
  step n [] (NSet.singleton n) rings


let mycalc ls =
  let base = 998244353 in
  let rec twopowmod c sol =
    if c=0 then sol else twopowmod (c-1) ((2 * sol) mod base)
  in
  (* let _ = Printf.printf "there are %d rings... %d\n " (List.length ls) ((2*(List.length ls)) mod base) in  *)
  twopowmod (List.length ls) 1
    
  
let solve adj = mycalc (split_rings (get_rings adj) adj)
              
let ntimes (f:unit->unit) (n:int) =
  let rec ntimes_f rem =
    if rem=0 then ()
    else begin f();ntimes_f (rem-1) end in
  ntimes_f n
  
        
let read_one_problem n =
  let adj = Array.make n [] in
  let add ix jx =
    let i = ix -1 and j = jx -1 in
    adj.(i) <- (j::adj.(i)) ;
    adj.(j) <- (i::adj.(j)) ;
    ()
  in
  let read_one_pair (_:unit) :unit =
    Scanf.bscanf (get_line ()) "%d %d" add
  in
  let _ = ntimes read_one_pair n in
  adj
  

let isempty l = match l with [] -> true | _ -> false
                                                   
let _ =
  let (numnodes,numedges) = (Scanf.bscanf (get_line ()) "%d %d" (fun x y->(x,y))) in
  if numnodes!=numedges then Printf.printf "0\n"
  else begin
      let adj = read_one_problem numnodes in
      if (exists isempty adj) then Printf.printf "0\n" else
        Printf.printf "%d\n" (solve adj)
    end
               
