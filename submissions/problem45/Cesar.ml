open Printf
open Array
open Scanf
open Scanning   

module NSet=Set.Make(Int)
   
(* adj has the adjacency matrix*)
                        
(* Step 1: partition the graph into Pr: ring nodes and 
   Pn: a tree that connect to  ring node n *)
(* Step 2: the number of paths that start in a node m that 
   is an a tree Tn are 1 to each other node in Tn and two to each other node
   so Tn generates paths: |Tn|*((|Tn|-1) + 2*(N-|Tn|))
   Ring nodes n that are in no tree generate 2*(N-1) paths.
   
   Note that we must divide by 2 because each path is counted twice
 *)

(* How to partition? :
 1. First, find the nodes that are in the ring.
 To do this use a recursive function that passes a set of 
 nodes to process, which is initialized with those nodes with
 out arity 1. The function maintains a vector
 of "remaining arity" of nodes. At each step process a node from the
 set of nodes to be processed, and substract one unit from adjacent nodes.
 If an adjacent node becomes arity 1, add it to the nodes to be processed.
 Add the current node to "processed nodes".
 When nodes to be processed is empty, "processed nodes are the not-ring nodes".

 2. Each ring node will represent a Tn. To calculate the set Tn,
 recursively traverse not-ring nodes from n adding at each step 
 all nodes to Tn.

 3. Traverse again each node in the ring, summing Fn for each, where
 Fn is: Fn= Sn * (1*(Sn-1)+ 2*(N-Sn))
 *)                    

let get_line () = Scanf.Scanning.from_string (Stdlib.read_line ())
          
let get_partition adj n ring =
  let procs = NSet.singleton n in
  let rec aux ls res =
    match ls with
      []     -> res
    | hd::tl -> if NSet.mem hd res
                then aux tl res
                else
                  aux (adj.(hd)@tl) (NSet.add hd res)
  in
  let succs = List.filter (fun i->not (NSet.mem i ring)) (adj.(n)) in
  aux succs procs


let print_nset ss =
  let els = NSet.elements ss in
  let _ = List.iter (fun i -> Printf.printf "%d " i) els in
  Printf.printf "\n"
  
let calc adj ring =
  let size = Array.length adj in
  let one n =
    let tn = get_partition adj n ring in
    let sn = NSet.cardinal tn in
    let res = sn * ((sn - 1) + 2 * (size - sn)) in
    (* let _ = Printf.printf "%d: %d * (%d - 1) + 2 * (%d - %d)\n" n sn sn size sn in *)
    res
  in
  List.fold_left (+) 0 (List.map one (NSet.elements ring))

let array_filter (arr:'a Array.t) (f:'a -> bool) =
  let filt (id,res) a = if f a then (id+1,id::res) else (id+1,res) in
  let (_,res) =  Array.fold_left filt (0,[]) arr in
  res

let setn n =
  let rec firstn i ls = if i=0 then i::ls else firstn (i-1) (i::ls) in
  NSet.of_list (firstn n [])
  
let get_ring adj : NSet.t =
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
       

let solve_one adj = calc adj (get_ring adj)

let ntimes (f:unit->unit) (n:int) =
  let rec ntimes_f rem =
    if rem=0 then ()
    else begin f();ntimes_f (rem-1) end in
  ntimes_f n

                  
let read_one_problem () =
  let numnodes = (Scanf.bscanf (get_line ()) "%d" (fun x->x)) in
  let adj = Array.make numnodes [] in
  let add ix jx =
    let i = ix -1 and j = jx -1 in
    adj.(i) <- (j::adj.(i)) ;
    adj.(j) <- (i::adj.(j)) ;
    ()
  in
  let read_one_pair (_:unit) :unit =
    Scanf.bscanf (get_line ()) "%d %d" add
  in
  let _ = ntimes read_one_pair numnodes in
  adj


let _ =
  let numprobs = (Scanf.bscanf (get_line ()) "%d" (fun x->x)) in
  let one () =
    let sol = solve_one (read_one_problem ()) in
    Printf.printf "%d\n" (sol/2)
  in
  ntimes one numprobs
  
