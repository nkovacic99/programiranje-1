let razlika_kvadratov a b = 2 * a * b

let uporabi_na_paru f (a, b) = (f a, f b)

let rec ponovi_seznam n ls = 
    match n with
        | 0 -> []
        | n when n < 0 -> []
        | n -> (ponovi_seznam (n - 1) ls) @ ls

let razdeli sez = 
    let rec raz_aux pacc nacc = function
        | [] -> (List.rev nacc, List.rev pacc)
        | h :: t -> if h >= 0 then raz_aux (h :: pacc) nacc t else raz_aux pacc (h :: nacc) t
    in raz_aux [] [] sez

type 'a veriga = 
    | Filter of ('a -> bool) * 'a list * 'a veriga
    | Ostalo of 'a list

let prazen_filter = Filter((>)0, [], Filter((>)10, [], Ostalo[]))

let rec vstavi x = function
    | Ostalo(ls) -> Ostalo(x :: ls)
    | Filter(f, ls, veriga) -> if (f x) then Filter(f, x :: ls, veriga) else Filter(f, ls, vstavi x veriga)

let rec pojdi_cez_seznam x = function
    | [] -> false
    | h :: t -> if h != x then pojdi_cez_seznam x t else true

let rec poisci x = function
    | Ostalo(ls) -> pojdi_cez_seznam x ls
    | Filter(f, ls, veriga) when f x -> pojdi_cez_seznam x ls
    | Filter(f, ls, veriga) -> poisci x veriga

let rec dodaj f = function
    | Ostalo(ls) -> Filter(f, [], Ostalo(ls))
    | Filter(g, ls, v) -> Filter(f, [], Filter(g, ls, v))

(* let rec dodaj_filter f = function
    | Ostalo(ls) -> Filter(f, [], Ostalo(ls))
    |  *)