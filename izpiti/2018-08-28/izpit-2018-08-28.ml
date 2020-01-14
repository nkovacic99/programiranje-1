let razlika_kvadratov a b = (2 * a * b) * (-1)

let uporabi_na_paru f = function
    | (a, b) -> (f a, f b)

let rec ponovi_seznam n ls= 
    match n with
    | 0 -> []
    | n when n < 0 -> []
    | n -> ls @  (ponovi_seznam (n - 1) ls)

let razdeli list = 
    let rec razdeli' nacc pacc = function
        | [] -> (List.rev nacc, List.rev pacc)
        | (h :: t) -> 
            if h < 0 then razdeli' (h :: nacc) pacc t 
            else razdeli' nacc (h::pacc) t
    in razdeli' [] [] list

type 'a veriga = 
    | Filter of ('a -> bool) * 'a list * 'a veriga 
    | Ostalo of 'a list

let test = Filter((<)0, [], Filter((<)10, [], Ostalo([])))

let rec vstavi x = function
    | Ostalo(ls) -> Ostalo(x :: ls)
    | Filter(f, ls, veriga) -> if f x then Filter(f, x :: ls, veriga) else Filter(f, ls, vstavi x veriga)

let rec poisci x = function
    | Ostalo(ls) -> List.mem x ls 
    | Filter(f, ls, veriga) when f x -> List.mem x ls
    | Filter(f, ls, veriga) -> poisci x veriga
