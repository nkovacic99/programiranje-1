type 'a improved_list = 
    | Empty of 'a array
    | Node of 'a array * 'a improved_list

let seznam = Node(Array.of_list [1; 2; 20],
            Node(Array.of_list [17; 19; 20; 30], 
            Node(Array.of_list [100], 
            Empty(Array.of_list []))))

(* pomožna funkcija, ki pomaga pri funkciji count *)
let rec prestej_el_ls = function
    | [] -> 0
    | h :: t -> 1 + prestej_el_ls t

let rec count = function
    | Empty(array) -> prestej_el_ls(Array.to_list array)
    | Node(array, ls) -> prestej_el_ls(Array.to_list array) + count ls

let rec nth i ls = 
    match (i, ls) with
        | (0, h :: t) -> Some h
        | (i, _) when i < 0 -> None
        | (_, []) -> None
        | (i, h :: t) -> nth (i - 1) t

let rec sorted_ls = function
    | [] -> true
    | x :: y :: t -> if x < y then sorted_ls (y :: t) else false

let rec is_sorted = function
    | Empty(array) -> sorted_ls(Array.to_list array)
    | Node(array, ls) -> sorted_ls(Array.to_list array) && is_sorted ls

(* pomožna funkcija za e) primer *)
let rec replace_values_ls i x ls = 
    match (i, ls) with
        | (_, []) -> failwith "prevelik indeks!"
        | (0, ls) -> x :: ls
        | (i, h :: t) -> h :: (replace_values_ls (i - 1) x t)

(* sicer vrne isti improved_list, ki je samo spremenjen *)
let rec update' ils i x = 
    match (i, ils) with
        | (i, Empty(array)) -> if i < List.length(Array.to_list array) then replace_values_ls i x (Array.to_list array) else failwith "prevelik indeks!"
        | (i, Node(array, ls)) -> if i < List.length(Array.to_list array) then replace_values_ls i x (Array.to_list array) else update' ls (i - List.length(Array.to_list array)) x
