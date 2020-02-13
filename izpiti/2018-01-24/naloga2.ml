type filter_tree = Node of int * filter_tree * filter_tree
                 | Box of int list
    
let example_tree = Node(10,
                Node(5, (Box [1]), (Box [])),
                Node(15, (Box []), (Box [19;20])))

let rec vstavi x drevo = 
    match drevo with
        | Node(y, l, r) -> if x > y then Node(y, l, vstavi x r) else Node(y, vstavi x l, r)
        | Box(xs) -> Box(x :: xs) 

let rec vstavi_seznam ls drevo = 
    match ls with
        | [] -> drevo
        | h :: t -> vstavi_seznam t (vstavi h drevo) 
