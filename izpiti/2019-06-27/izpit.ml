type complex = {re: float; im: float}

let complex_add a b = {re = a.re +. b.re; im = a.im +. b.im}

let complex_conjugate a = {re = a.re; im = (-1.0) *. a.im}

let rec list_apply_either pred f g ls = 
    match ls with
        | [] -> []
        | h :: t when f h -> (f h) :: list_apply_either pred f g t
        | h :: t -> (f g) :: list_apply_either pred f g t

let rec potenciraj x n = 
    match n with
        | 0 -> 1
        | n -> x * potenciraj x (n - 1)

let p = [3; (-2); 0; 1]

let eval_poly ls t = 
    let rec polinom_v_tocki poz ls t acc =
        match ls with
            | [] -> (acc - 1)
            | x :: xs -> polinom_v_tocki (poz + 1) xs t (x * (potenciraj poz t) + acc )in
        polinom_v_tocki 0 ls t 0

(* ----------------------------------------------------- *)

type najemnik = string

type vrt =  | Obdelovan of najemnik
            | Oddan of najemnik * (vrt * vrt list)
            | Prost

let vrt_primer = Oddan ("Kovalevskaya" ,
                  (Obdelovan "Galois",
                   Prost ::
                   [Obdelovan "Lagrange"] ))

let obdelovalec_vrta = function
    | Obdelovan x -> Some x
    | Oddan (ime, _) -> None
    | Prost -> None

(* let rec globina_oddajanja vrt = function
    | Oddan (_, (podvrt, podvrtovi)) -> 1 + globina_oddajanja podvrtovi
    | _ -> 0 *)

let rec v_uporabi = function
    | Prost -> false
    | Obdelovan x -> true
    | Oddan (_, (podvrt, podvrtovi)) -> v_uporabi podvrt

(* let vsi_najemniki vrt = 
    let rec najemniki_aux acc vrt = function
        | Prost -> [] :: acc
        | Obdelovan x -> x :: acc
        | Oddan (x, (podvrt, podvrtovi)) -> najemniki_aux (x :: acc) (podvrt, podvrtovi)
    in najemniki_aux [] vrt *)
    