let rec map2_opt f ls1 ls2 ls = 
    match (ls1, ls2) with
        | ([], []) -> Some [List.rev ls]
        | ([], ls2) -> None
        | (ls1, []) -> None
        | (x :: xs, y :: ys) -> map2_opt f xs ys (f x y :: ls) 

let map2_opt f ls1 ls2 =
    if List.length ls1 != List.length ls2 then None
    else
        let rec map2_aux acc ls1 ls2= 
            match (ls1, ls2) with
                | ([], _) | (_, []) -> Some (List.rev acc)
                | (x :: xs, y :: ys) -> map2_aux ((f x y) :: acc) xs ys
            in map2_aux [] ls1 ls2