
let rec get_line left right height = function
  | 0 -> left ^ "1" ^ right
  | w -> if height - w > 0 then
           get_line (left ^ "1") ("1" ^ right) height (w-1)
         else
           get_line (left ^ "_") ("_" ^ right) height (w-1)

let rec get_lines lines width = function
  | 0 -> lines
  | h -> get_lines ((get_line "" "" h (width/2))::lines) width (h-1)

let triangle width height =
  get_lines [] width height

let add str =
  List.map (fun line -> str ^ line ^ str)

let twice =
  List.map (fun line -> line ^ "_" ^ line)

let rec sierpinski width height f = function
  | 0 -> f (triangle width height)
  | n -> sierpinski (width/2) (height/2)
           (fun s ->
             f ((add (String.make (width/4+1) '_') s) @ (twice s)))
           (n-1)

let () =
  match read_int_opt () with
  | Some n when n > -1 && n < 6 ->
     List.iter (fun line -> Printf.printf "%s\n" line)
       (sierpinski 63 32 (fun x -> x) n)
  | Some n ->
     Printf.printf "Some bad number\n"
  | None ->
     Printf.printf "Not a number\n"
