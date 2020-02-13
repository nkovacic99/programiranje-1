let podvoji_vsoto a b = 2 * (a + b)

let povsod_vecji (a, b, c) (x, y, z) = a > x && b > y && c > z

let uporabi_ce_lahko f = function
    | None -> None
    | Some x -> Some (f x)

let rec prestej_ponovitve ls x = 
    match ls with
        | [] -> 0
        | h :: t -> if h = x then 1 + (prestej_ponovitve t x) else (prestej_ponovitve t x)
    
let rec pojavi_dvakrat ls x = (prestej_ponovitve ls x = 2)

let rec izracunaj_v_tocki lsf t = 
    match lsf with
        | [] -> []
        | f :: g -> (f t) :: (izracunaj_v_tocki g t) 

let eksponent x p = 
    let rec eks_aux acc p = 
        match p with
            | 1 -> acc
            | p -> eks_aux (x * acc) (p - 1)
    in eks_aux 1 p

(* --------------------------------------------------- *)

type 'a mm_drevo = 
    | Empty
    | Node of 'a mm_drevo * 'a * int * 'a mm_drevo

let rec vstavi x = function
    | Empty -> Node(Empty, x, 1, Empty)
    | Node(l, h, int, r) when h = x -> Node(l, h, int + 1, r)
    | Node(l, h, int, r) when h > x -> Node(vstavi x l, h, int, r)
    | Node(l, h, int, r) -> Node(l, h, int, vstavi x r)


let rec multimnozica_iz_seznama = 
  List.fold_left (fun mmtree x -> vstavi x mmtree) Empty

let rec velikost_multimnozice = function
    | Empty -> 0
    | Node(l, _, int, r) -> velikost_multimnozice l + int + velikost_multimnozice r
 