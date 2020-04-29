open Printf
  
type taken = (int*int*int*int*int*int*int*int*int*int)
type memo_tb = (taken*int,int) Hashtbl.t

let array_to_taken t=
  (t.(0),t.(1),t.(2),t.(3),t.(4),t.(5),t.(6),t.(7),t.(8),t.(9))

let max a b = if a>b then a else b

let list_max ls = List.fold_left compare 0 ls
let get_list a i j =
  let rec fromi i = if i>j then [] else a.(i)::(fromi (i+1)) in
  fromi i
let max_left  t = list_max (get_list t 0 4)
let max_right t = list_max (get_list t 5 9)

let next_left  pos = (pos    +1) mod 5
let next_right pos = ((pos+5)-1) mod 5

let arc_left  pos = pos
let arc_right pos = pos+5

let inc t i = let v = t.(i) in t.(i)<-(v+1) ; t
let dec t i = let v = t.(i) in
	      let _ = if v=0 then printf "error dec\n" in
	      let _ = t.(i)<-(v-1) in t

let sum a b =
  let c=a+b in
  if a<max_int/2 && b<max_int/2 then a+b else
    begin
      printf "be careful, either %d or %d is too big in %d=%d+%d\n" a b c a b;
      c
    end

let maxturns=ref 70
  
let solve maxl maxr =
  (* let _ = printf "solve maxl:%d maxr:%d\n" maxl maxr in  *)
  let memo:memo_tb=Hashtbl.create 10000000 in
  let empty = Array.make 10 0 in
  let isin t i  = Hashtbl.mem memo (array_to_taken t,i) in
  let find t i  = Hashtbl.find memo (array_to_taken t,i) in
  let add t i n = Hashtbl.add memo (array_to_taken t,i) n in
  let rec calc t i pos =
    (* let _ = printf "calc %d %d\n" i pos in*)
    let recalc () =
      let goleft () =
	if t.(arc_left pos)>=maxl then 0
	else
	  let _ = inc t (arc_left pos) in
	  let v = calc t (i+1) (next_left pos) in
	  let _ = dec t (arc_left pos) in
	  v
      and goright () =
	if t.(arc_right pos)>=maxr then 0
	else
	  let _ = inc t (arc_right pos) in
	  let v = calc t (i+1) (next_right pos) in
	  let _ = dec t (arc_right pos) in
	  v
      in
      sum (goright()) (goleft())
    in
    if i = !maxturns then
      if pos = 0 then 1 else begin printf "not facing north!\n" ; 1 end
    else if isin t i then find t i else
      let c = recalc () in
      let _ = add t i c in
      c
  in
  let sol = calc empty 0 0 in
  let _ = Hashtbl.clear memo  in
  sol

let sol = ref 0    

let _ =
  let _ = maxturns:=70 in
  for l=0 to 14 do
    let r = 14-l in
    let s = (solve l r) in
    let _ = printf "summing %2d %2d -> %d\n" l r s in
    let _ = sol:= sum !sol s in
    ()
  (* Printf.printf "%d %d -> %d\n" l r s*)
  done ;
  printf  "%d\n" !sol
