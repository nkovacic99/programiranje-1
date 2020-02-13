type complex = {re: float; im: float}

let complex_add x y = {re =  x.re +. y.re; im =  x.im +. y.im}

let complex_conjugate x = {re = x.re; im = x.im *. (-1.0)}

let rec list_apply_either pred f g = function
    | [] -> []
    | h :: t -> if (pred h) then (f h) :: list_apply_either pred f g t else (g h) :: list_apply_either pred f g t 

let rec stopnja_polinoma = function
    | h :: [] -> 0
    | h :: t -> 1 + stopnja_polinoma t 
    | [] -> -1

let rec potenca n x = 
    match n with 
        | 0 -> 1
        | n -> x * potenca (n - 1) x 

type najemnik = string

type vrt = 
    |Obdelovan of najemnik
    |Oddan of najemnik * (vrt * vrt list)
    |Prost

let vrt_primer = Oddan("Kovalevskaya", 
                    (Obdelovan("Galois"), 
                    Prost :: 
                    [Obdelovan("Lagrange")]))

let obdelovalec_vrta = function
    | Obdelovan(ime) -> Some ime
    | _ -> None
 
 let rec globina_oddajanja = function
    | Prost -> 0
    | Obdelovan(_) -> 0
    | Oddan(ime, (vrt, vrtovi)) -> 1 + globina_oddajanja vrt
