let is_int x = 
    if (x - x) = 0 then true else false

let option_sum a b = 
    if is_int(a + b) then Some(a + b) else None

let twostep_map f g h x = 
    let (x1, x2) = f x 
    in (g x1, h x2)

let primer = twostep_map (fun x -> (x, x)) ((+) 1) ((-) 2) 3;;

(* pomožna funkcija za c) primer *)
let rec ponovi_el x n = 
    match n with
        | 0 -> List.flatten []
        | n -> x :: ponovi_el x (n - 1)

(* let rec function_repeat f = function
    | [] -> []
    | h :: t -> ponovi_el h (f h) :: function_repeat f t *)

(* let rec flatten' = function
    | [] -> []
    | ls :: t -> List.flatten ls :: flatten' t *)
 

let function_repeat f ls =
    let rec frepeat' acc = function
        | [] -> List.flatten(List.rev acc)
        | h :: t -> if (f h) > 0 then frepeat' (ponovi_el h (f h) :: acc) t else frepeat' acc t
    in frepeat' [] ls

(* komentar: funkcija hrani v acc vse f x ponovitve danega elementa x, kar je
hitreje, saj acc kličemo zgolj enkrat in ne "nalagamo" dela funkciji v vsakem koraku. 

dodaten komentar: prav tako sem uporabil flatten, zaradi zasnove fukcije "ponovi_el".*)

let rec iterate cond f x =
    if cond x then x else iterate cond f (f x)