let odstej_trojici (a, b, c) (x, y, z) = (a - x, b - y, z - c)

let max_rezultat_do_n f n =
    let rec max' f n m = 
        match n with
            | n when n <= 0 -> max (f n) m
            | n -> if (f n) > m then max' f (n - 1) (f n) else max' f (n - 1) m
    in max' f n 0

let rec pocisti_seznam = function
    | [] -> []
    | None :: t -> pocisti_seznam t
    | Some(x) :: t -> Some(x) :: pocisti_seznam t

let pocisti_seznam' =
    let rec clean' acc = function
        | [] -> List.rev acc
        | None :: t -> clean' acc t
        | Some(x) :: t -> clean' (Some(x) :: acc) t
    in clean' []

let razdeli_na_sl = 
    let rec sl sacc lacc = function
        | [] -> (List.rev sacc, List.rev lacc)
        | h :: t -> if h mod 2 = 0 then sl (h :: sacc) lacc t else sl sacc (h :: lacc) t
    in sl [] []

let rec narascajoce = function
    | [] -> true
    | h :: [] -> true
    | x :: y :: t -> if x <= y then narascajoce (y :: t) else false

let rec padajoce = function
    | [] -> true
    | h :: [] -> true
    | x :: y :: t -> if x > y then padajoce (y :: t) else false

let preveri_urejenost ls = 
    let (soda, liha) = razdeli_na_sl ls in 
    narascajoce soda && padajoce liha 