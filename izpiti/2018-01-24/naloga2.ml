type 'a filter_tree =
    | Vozlisce of 'a filter_tree * int *  'a filter_tree 
    | List of 'a list

let test_tree  = Vozlisce(Vozlisce(List[1], 5, List[]), 10, Vozlisce(List[0], 15, List[19; 20]))

