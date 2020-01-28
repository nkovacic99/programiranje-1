let uporabi f a = f a

let ibaropu g a = g a

let zacetnih n ls = 
    if n > List.length ls then None
    else
        let rec zac_aux acc n ls =
            match (n, ls) with
                | (0, _) -> Some (List.rev acc)
                | (n, []) -> Some (List.rev acc)
                | (n, h :: t) -> zac_aux (h :: acc) (n - 1) t
            in zac_aux [] n ls

type 'a neprazen_sez = Konec of 'a | Sestavljen of 'a * 'a neprazen_sez

let prvi = function
    | Konec(x) -> x
    | Sestavljen(x, ls) -> x

let rec zadnji  = function
    | Konec(x) -> x
    | Sestavljen(_, ls) -> zadnji ls  

let rec dolzina = function
    | Konec(_) -> 1
    | Sestavljen(_, ls) -> 1 + dolzina ls

let rec pretvori_v_seznam = function
    | Konec(x) -> [x]
    | Sestavljen(x, ls) -> x :: pretvori_v_seznam ls

let rec zlozi f = function
    | Konec(x) -> Konec(f x)
    | Sestavljen(x, ls) -> Sestavljen(f x, zlozi f ls)

let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []

let rec char_to_int = function
    | [] -> []
    | h :: t -> (int_of_char h) :: (char_to_int t)
