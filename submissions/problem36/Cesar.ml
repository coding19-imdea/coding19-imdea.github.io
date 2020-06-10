open Float

let pi = 2.0 *. asin 1.0
  
let cal r =
  let r2 = r *. r in
  let a4 = r2 *. ( pi /. 3.0 -. ((sqrt 3.0) -. 1.0)) in
  let a3 = 2.0 *. (r2 *. ((pi /. 2.0) -. 1.0) -. a4) in
  let a2 = r *. r -. (a4 +. a3) in
  (a2,a3,a4)

let pr (a2,a3,a4) = Printf.printf "%.3f %.3f %.3f\n" a4 a3 a2


let _ =
  let _ = pr (cal 4794.6) in
  let _ = pr (cal 0.1) in
  let _ = pr (cal 0.2) in
  let _ = pr (cal 0.3) in
  ()
  
