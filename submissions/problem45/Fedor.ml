type node = {
    id:               int;
    mutable ns:       node list;
    mutable length:   int;
    mutable seen:     bool;
    mutable visited:  bool;
    mutable bad:      bool;
  }

type env = {nodes: node option array}

let new_node id = {
    id       = id;
    ns       = [];
    length   = 0;
    seen     = false;
    visited  = false;
    bad      = false;
  }

let empty_env n = {nodes = Array.make n None}

let connect n1 n2 =
  n1.length <- n1.length + 1;
  n2.length <- n2.length + 1;
  n1.ns <- n2::n1.ns;
  n2.ns <- n1::n2.ns

let get_node env id =
  match env.nodes.(id-1) with
  | Some n -> n
  | None -> let n = new_node (id-1) in
            env.nodes.(id-1) <- Some n;
            n

let rec cycle pid n =
  if n.seen then Some (n, pid)
  else (
    n.seen <- true;
    let rec iter = function
      | [] -> None
      | c::cs -> if c.id <> pid then
                   match cycle n.id c with
                   | None -> c.bad <- true; iter cs
                   | c -> c
                 else iter cs
    in
    iter n.ns
  )

let rec back id n pid (cs, sum) =
  if n.id = id then (
    n.visited <- true;
    let cs = if n.length > 2 then n::cs else cs in
    cs, sum + 1
  ) else (
    let rec iter ns =
      let c, cs = List.hd ns, List.tl ns in
      if c.seen && not c.bad && c.id != pid then c
      else iter cs
    in
    n.visited <- true;
    let cs = if n.length > 2 then n::cs else cs in
    back id (iter n.ns) n.id (cs, sum+1)
  )

let rec size s css = function
  | [] -> (match css with
          | [] -> s
          | cs::css -> size s css cs)
  | n::ns -> if n.visited then size s css ns
             else (n.visited <- true; size (s + n.length - 1) (n.ns::css) ns)

let rec components ns =
  List.fold_left
    (fun res n -> (size (n.length - 2) [] n.ns)::res) [] ns

let count cz cs =
  let s = cz * (cz - 1) in
  let _, s =
    List.fold_left
      (fun (s, t) c -> c + s, t + 2*c*s + c + (c*(c-1))/2) (cz-1, s) cs in
  s

let read line env =
  let ns = String.split_on_char ' ' line in
  let id1 = int_of_string (List.hd ns) and
      id2 = int_of_string (List.hd (List.tl ns)) in
  let n1 = get_node env id1 and
      n2 = get_node env id2 in
  connect n1 n2

let () =
  let t = read_int () in
  for i = 1 to t do
    let n = read_int () in
    let e =  empty_env n in
    for j = 1 to n do
      read (read_line ()) e
    done;
    match cycle (-1) (get_node e 1) with
    | None -> ()
    | Some (n, pid) ->
       let cs, s = back n.id (get_node e (pid+1)) n.id ([], 0) in
       let s = count s (components cs) in
       print_int s; print_string "\n";
  done
