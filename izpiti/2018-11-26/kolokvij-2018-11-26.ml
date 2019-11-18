(* -------- 1 -------- *)

let sum_list lst = 
  let rec sum_list_aux acc = function
    | [] -> acc
    | x :: xs -> sum_list_aux (acc + x) xs
  in sum_list_aux 0 lst (*To pomeni, da začnemo pri acc = 0.*)

(* -------- 2 -------- *)

let rec ur_sez = function
  | [] | [_] -> true
  | x :: y :: xs -> x < y && ur_sez (y :: xs)

(* -------- 3 -------- *)

let rec insrt_num sez num = 
  match sez with
  | [] -> [num]
  | x :: xs -> if num <= x then num :: x :: xs else x :: insrt_num (xs) num

(* -------- 4 -------- *)

(* -------- 5 -------- *)
type priority = Top | Group of int
type status = Staff | Passanger of priority

(*type flyer = { status : status ; name : string }

let flyers = [ {status = Staff; name = "Quinn"}
             ; {status = Passenger (Group 0); name = "Xiao"}
             ; {status = Passenger Top; name = "Jaina"}
             ; {status = Passenger (Group 1000); name = "Aleks"}
             ; {status = Passenger (Group 1000); name = "Robin"}
             ; {status = Staff; name = "Alan"}
             ]*)

(* -------- 6 -------- *)
(* -------- 7 -------- *)
