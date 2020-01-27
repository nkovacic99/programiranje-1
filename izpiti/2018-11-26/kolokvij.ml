let sum_ls ls = 
    let rec sum_aux acc = function
        | [] -> acc
        | h :: t -> sum_aux (h + acc) t
    in sum_aux 0 ls

let rec narascajoc_ls = function
    | [] -> true
    | _ :: [] -> true
    | x :: y :: t -> if x <= y then narascajoc_ls (y :: t) else false

let rec vstavi e = function
    | [] -> [e]
    | h :: t -> if h <= e then h :: (vstavi e t) else (e :: h :: t) 

(* let rec vstavi' e cmp = function
    | [] -> [e]
    | h :: t -> if h cmp e then h :: (vstavi' e t) else (e :: h :: t)
     *)

type priority = 
    | Top
    | Group of int

type status = 
    | Staff
    | Passenger of priority

type flyer = {status: status; name: string}

let flyers = [{status = Staff; name = "Quinn"}; {status = Passenger (Group 0); name = "Xiao"}; {status = Passenger Top; name = "Jaina"}; {status = Passenger (Group 1000); name = "Aleks"}; {status = Passenger (Group 1000); name = "Robin"}; {status = Staff; name = "Alan"}]

