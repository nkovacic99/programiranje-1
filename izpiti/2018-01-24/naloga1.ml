let rec map2_opt f ls1 ls2 ls = 
    match (ls1, ls2) with
        | ([], []) -> Some [List.rev ls]
        | ([], ls2) -> None
        | (ls1, []) -> None
        | (x :: xs, y :: ys) -> map2_opt f xs ys (f x y :: ls) 

(* let map2_opt' f ls1 ls2 = 
    let rec map' f acc = function
        | ([], []) -> Some([acc])
        | (_, []) | ([], _) -> None
        |  (x :: xs, y :: ys) -> map' f ((f x y) :: acc)
    in map' f [] ls1 ls2 *)