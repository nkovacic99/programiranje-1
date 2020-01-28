let odstej_trojici (a, b, c) (x, y, z) = (a - x, b - y, c - z)

let max_rezultat_do_n f n = 
    let rec trenutni_maksimum f n m = 
        match n with
            | 0 -> m
            | n -> if (f n) > m then trenutni_maksimum f (n - 1) (f n) else trenutni_maksimum f (n - 1) m
        in trenutni_maksimum f n 0
    
let rec pocisti_seznam = function
    | [] -> []
    | h :: t -> if h = None then pocisti_seznam t else h :: pocisti_seznam t

let pocisti_seznam' = 
    let rec pocisti_aux acc = function
        | [] -> List.rev acc
        | h :: t -> if h = None then pocisti_aux acc t else pocisti_aux (h :: acc) t
    in pocisti_aux []

let rec narasca = function
    | [] | _ :: [] -> true
    | x :: y :: t -> if x <= y then narasca (y :: t) else false

let rec pada = function
    | [] | _ :: [] -> true
    | x :: y :: t -> if x >= y then pada (y :: t) else false

let loci_na_dva_seznama list = 
    let rec loci' soda liha list = 
        match list with
            | [] -> (soda, liha)
            | h :: t -> if (h mod 2) = 0 then loci' (soda @ [h]) liha t else loci' soda (liha @ [h]) t
    in loci' [] [] list

let preveri_urejenost list = 
    let (soda, liha) = loci_na_dva_seznama list in
    narasca soda && pada liha

(*---------------------------------*)

type 'a gnezdenje = 
    | Element of 'a
    | Podseznam of 'a gnezdenje list

let gnezdenje_primer = Podseznam[Element(1); Element(2); Podseznam[Element(3); Podseznam[Element(4)]; Podseznam[ ]]; Podseznam[Element(5)]]

let rec najvecja_globina = function
    | Podseznam[] -> 1
    | Element(_) -> 0
    | Podseznam[_; Podseznam[ls]] -> 1 + najvecja_globina ls
    | _ -> 0
