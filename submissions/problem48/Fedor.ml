open Array

let rec sum a b m = ((a mod m) + (b mod m)) mod m
    and sub a b m = ((a mod m) - (b mod m) + m) mod m
    and mul a b m = ((a mod m) * (b mod m)) mod m
    and div a b m = ((a mod m) * ((pow b (m - 2) (fun x -> x) m) mod m)) mod m
    and pow a n c m = match n with
      | 0 -> 1 | 1 -> c a
      | _ -> if n mod 2 = 0 then pow a (n / 2) (fun r -> c (mul r r m)) m
             else pow a (n / 2) (fun r -> c (mul (mul r r m) a m)) m

let rec iter a i n m r b1 b2 =
  if i >= n then div (mul r b2 m) b1 m
  else iter a (i+1) n m
         (sum (sub r a.(i) m) a.(2*n-1-i) m)
         (mul b1 (i+1) m)
         (mul b2 (2*n-i) m)

let () =
  let n = read_int ()  in
  let a = make (2*n) 0 in
  let i = ref 0        in
  let r = ref ""       in
  let m = 998244353    in
  String.iteri (fun j c ->
      match c with
      | ' ' -> a.(!i) <- int_of_string !r;
               r := ""; i := !i+1
      |  _  -> r := !r ^ String.make 1 c
    ) (read_line ());
  a.(!i) <- int_of_string !r;
  sort compare a;
  print_int (iter a 0 n m 0 1 1);
  print_string "\n"
