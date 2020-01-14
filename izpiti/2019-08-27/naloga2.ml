type 'a gnezdenje = 
    | Element of 'a
    | Podseznam of 'a gnezdenje list

let gnezdenje_primer = 
  [ Element 1;
    Element 2;
    Podseznam [
      Element 3;
      Podseznam [Element 4];
      Podseznam [];
    ] ;
    Element 5
  ]

let rec najvecja_globina = function
  | [] -> 1
  | Element _ :: xs -> najvecja_globina xs
  | Podseznam podsez :: xs ->
      max (najvecja_globina podsez + 1) (najvecja_globina xs)