let uporabi f x = f x

let ibaropu x f = f x

(* let rec zacetnih n xs =
  if n <= 0 then
    Some []
  else
    match xs with
    | [] -> None
    | x::xs ->
      begin match zacetnih (n-1) xs with
       | None -> None
       | Some t -> Some (x :: t)
      end *)

type 'a neprazen_sez = 
    | Konec of 'a
    | Sestavljen of 'a * 'a neprazen_sez

let prvi = function
    | Konec(h) -> h
    | Sestavljen(h, t) -> h

let rec zadnji = function
    | Konec(h) -> h
    | Sestavljen(h, t) -> zadnji t

let rec dolzina = function
    | Konec(_) -> 1
    | Sestavljen(h, t) -> 1 + dolzina t

let rec pretvori_v_seznam = function
    | Konec(h) -> [h]
    | Sestavljen(h, t) -> h :: pretvori_v_seznam t

let rec zlozi f s = function
  | Konec x -> f s x
  | Sestavljen (x, l) -> zlozi f (f s x) l