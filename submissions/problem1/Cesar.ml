
let is_dash n r c =
  let off dr dc w =
    (r-dr>0) && (c-dc>0) &&
    (r-dr)<=(c-dc) && (c-dc) <= w-(r-dr) in
  let is_dash_1 = (c <= (32-r)) || (c >= (32+r)) in
  let is_dash_2 = (off 16 16 32) in
  let is_dash_3 = ((off 8 24 16) || (off 24 8 16) || (off 24 40 16)) in
  let is_dash_4 = ((off 4 28 8) ||
    (off 12 20 8) || (off 12 36 8) ||
    (off 20 12 8) || (off 20 44 8) || 
    (off 28 4 8) || (off 28 20 8) || (off 28 36 8) || (off 28 52 8)) in
  let is_dash_5 =
    (   (off 30 2 4) || (off 30 10 4) || (off 30 18 4) || (off 30 26 4) ||
	(off 30 34 4) || (off 30 42 4) || (off 30 50 4) || (off 30 58 4) ||
	( off 26 6 4) || ( off 26 22 4) || (off 26 38 4) || ( off 26 54 4) ||
	( off 22 10 4) || ( off 22 18 4) || (off 22 42 4) || ( off 22 50 4) ||
	( off 18 14 4) || ( off 18 46 4) ||
	( off 14 18 4) || (off 14 26 4) || (off 14 34 4) || (off 14 42 4) ||
	( off 10 22 4)  || (off 10 38 4) ||
      	( off 6 26 4)  || (off 6 34 4) ||
  	( off 2 30 4) ) in
  let is_dash_6 =
    let triangle x y = (* x1: y:31*)
      ( (off x y 2) || (off (x+2) (y-2) 2) || (off (x+2) (y+2) 2) || (off (x+4) (y-4) 2) || (off (x+4) (y+4) 2) || (off (x+6) (y-6) 2) || (off (x+6) (y-2) 2) || (off (x+6) (y+2) 2) || (off (x+6) (y+6) 2)) in
    triangle 1 31 || triangle 9 23 || triangle 9 39 || triangle 17 15 || triangle 17 47 || triangle 25 7 || triangle 25 23 || triangle 25 39 || triangle 25 55
  in
  ( (n>=1 && is_dash_1) ||
    (n>=2 && is_dash_2) ||
    (n>=3 && is_dash_3) ||
    (n>=4 && is_dash_4) ||
    (n>=5 && is_dash_5) ||
    (n>=6 && is_dash_6)
  )

let print n =
  for r=1 to 32 do
    for c=1 to 63 do
      if is_dash n r c then
	Printf.printf "-"
      else
	Printf.printf "1"
    done ;
    Printf.printf "\n"
  done


let _ =
  let n = (int_of_string Sys.argv.(1)) in
  if n>6 then Printf.printf "error n<=4\n"
  else
    print (n+1)
