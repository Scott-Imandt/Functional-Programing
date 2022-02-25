let calc (input: int)(input2: int): int = 
  input * input2;;

print_int(calc 5 4);;

let is_zero (x: int): string =
  match x with
    | 0 -> "True"
    | _ -> "False";;

print_endline(is_zero 0);;


let y : int list = [1;2;3];;

let rec size_of_list (list: int list): int = 
  match list with
  |[] -> 0
  |h::t -> 1 + ((size_of_list t))
;;

print_int (size_of_list y);; 