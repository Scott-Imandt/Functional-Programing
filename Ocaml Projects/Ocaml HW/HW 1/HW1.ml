(*Scott Imandt #112374701   HW1**)

(*Q1a. Write a recursive function pow, which takes two integer parameters x and n, and returns x^n.
  Q1b. Also write a function float pow, which does the same thing, but for x being a float. You can assume that n is
       non-negative integer for both functions. **)


(*Q1a*)
let rec pow x n =
  match n with
  |0 -> 1
  |1 -> x
  |n -> x * pow x (n-1)
  ;;

print_string("Q1a: ");; print_string("3^6 -> ");; print_int(pow 3 6);;
print_endline(" ");;


(*Q1b*)
let rec float_pow (x: float) n = 
  match n with
  |0 -> 1.0
  |1 -> x
  |n -> x *. float_pow x (n-1)
;;

print_string("Q1b: ");; print_string("5.876^5 -> ");; print_float(float_pow 5.876 5);;
print_endline(" ");;


(*Q2. Write a function compress to remove consecutive duplicates from a list.*)

(*Q2*)

let listA = ["a";"a";"b";"c";"c";"a";"a";"a";"e";"e";"e"];;

let rec compress l =
  match l with
  | [] -> []
  | [_] -> l
  | h :: t -> if h = (List.hd t) then compress t else h :: compress t
;;

(*Helper function to print a String list *)
let rec printStringList x =
  match x with
  |[] -> []
  |h::t -> print_string(h ^ " "); printStringList t
;;

(*Helper function to print a int list*)
let rec printIntList x =
  match x with
  |[] -> []
  |h::t -> print_int(h); print_string(" "); printIntList t
;;


print_string("Q2:  ");; printStringList(listA);;print_string(" -> ");;
printStringList(compress listA);; (* helper printStringList function from line 46*)
print_endline(" ");;

(*Q3 Write a function remove_if of the type 'a list -> ('a -> bool) -> 'a list, which takes a list and a predicate, and
   removes all the elements that satisfy the condition expressed in the predicate.*)

(*Q3*)

let listB = [1;2;3;4;5];;

let rec remove_if l f =
  match l with
  | [] -> []
  | h::t -> if f h then remove_if t f else h :: remove_if t f
;;

print_string("Q3:  ");; printIntList(listB);; print_string(" -> ");;
printIntList(remove_if listB (fun x -> x mod 2 = 1));; (* helper printIntList function from line 53*)
print_endline(" ");;

(*Q4 Some programming languages (like Python) allow us to quickly slice a list based on two integers i and j,
 to return the sublist from index i (inclusive) and j (not inclusive). We want such a slicing function
in OCaml as well.
Write a function slice as follows: given a list and two indices, i and j, extract the slice of the list
containing the elements from the ith (inclusive) to the jth (not inclusive) positions in the original list.

# slice ["a";"b";"c";"d";"e";"f";"g";"h"] 2 6;;
- : string list = ["c"; "d"; "e"; "f"]

Invalid index arguments should be handled gracefully. For example,
# slice ["a";"b";"c";"d";"e";"f";"g";"h"] 3 2;;
- : string list = []

# slice ["a";"b";"c";"d";"e";"f";"g";"h"] 3 20;
- : string list = ["d";"e";"f";"g";"h"];
You do not, however, need to worry about handling negative indices.*)

let rec slice l i j =
  if i>=j then [] else
  match l with
  | [] -> []
  | h::t -> if i>0 then slice t (i-1) (j-1) else if j>0 then h::slice t i (j-1) else []
;;

print_string("Q4:  ");; printStringList(["a";"b";"c";"d";"e";"f";"g";"h"]);; print_string(" -> ");;
printStringList(slice ["a";"b";"c";"d";"e";"f";"g";"h"] 2 6);; (* helper printStringList function from line 46*)
print_endline(" ");;
                  
            

