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

(*Q5 Write a function equivs of the type ('a -> 'a -> bool) -> 'a list -> 'a list list, which partitions a list
 into equivalence classes according to the equivalence function.*)
                  

(*Q5*)

let rec listChecker list1 list2 =
  match list1 with
  | [] -> list2
  | h::t -> let x = (remove_if list2 (fun x -> x = h)) in (listChecker t x);; (*Used Q3 function*)

let rec equivsHelper f a lst =
  match lst with
  | [] -> []
  | h::t -> if (f a h) then h :: (equivsHelper f a t) else (equivsHelper f a t);;

let rec equivs f list =
  match list with
  | [] -> [[]]
  | h::t -> let x = (equivsHelper f h list) in
      let y = (listChecker x t) in
      match y with
      | [] -> [x]
      | hd::tl -> x :: (equivs f y);;



print_string("Q5:  ");; printIntList([1;2;3;4;5;6;7;8]);; print_string(" -> ");;
print_string("Print output function not created");;
print_endline(" ");;


(*Q6 Goldbach’s conjecture states that every positive even number greater than 2 is the sum of two prime (10)
numbers. E.g., 18 = 5 + 13, or 42 = 19 + 23. It is one of the most famous conjectures in number theory.
It is unproven, but verified for all integers up to 4 × 1018. Write a function goldbachpair : int ->
int * int to find two prime numbers that sum up to a given even integer. The returned pair must have
a non-decreasing order. Note that the decomposition is not always unique. E.g., 10 can be written as 3+7 or as 5+5, so both
(3, 7) and (5, 5) are correct answers.*)

let isprime input =
  let rec divideCheck div =
    div * div > input || (input mod div != 0 && divideCheck (div + 1)) in
  divideCheck 2;;

let rec numcalc a b =
  if a > b then (0,0) else if isprime a &&  isprime b then (a,b) else numcalc (a+1) (b-1);;


let goldbachpair x =
  match x with
  |0 -> (0,0)
  |1 -> (0,1)
  |2 -> (1,1)
  |_ -> if (x > 2) && ((x mod 2) = 0) then numcalc 1 (x-1) else (0,0);;


let printTupleInt x =
  match x with
  |(a,b) -> print_string("("); print_int(a); print_string(","); print_int(b); print_string(")");;


print_string("Q6:  ");; print_int(10);; print_string(" -> ");;
printTupleInt(goldbachpair 10);;
print_endline(" ");;

(*Q7 Write a function called equiv on, which takes three inputs: two functions f and g, and a list lst. It (10)
returns true if and only if the functions f and g have identical behavior on every element of lst.*)

(*Q7*)
let rec equiv_on f g list =
  match list with
  |[] -> true
  |h::t -> if (f h) = (g h) then equiv_on f g t else false
;;

let x i =  i*i;;
let z i =  3*i;;

let printBoolien x =
  match x with
  |false -> print_string("False")
  |true -> print_string("True")
;;

print_string("Q7:  ");; printIntList([3]);; print_string(" -> ");;
printBoolien(equiv_on x z [3]);;
print_endline(" ");;

(*Q8 Write a functions called pairwisefilter with two parameters: (i) a function cmp that compares two
elements of a specific type T and returns one of them, and (ii) a list lst of elements of that same type
T. It returns a list that applies cmp while taking two items at a time from lst. If lst has odd size, the
last element is returned “as is”.*)

(*Q8*)
let rec pairwisefilter cmp list = 
  match list with
  |[] -> []
  |[_] -> list
  |h::t -> (cmp h (List.hd t)) :: pairwisefilter cmp (List.tl t)
;;

print_string("Q8:  ");; printIntList([14; 11; 20; 25; 10; 11]);; print_string(" -> ");;
printIntList(pairwisefilter min [14; 11; 20; 25; 10; 11]);;
print_endline(" ");;

(*Q9 Write the polynomial function, which takes a list of tuples and returns the polynomial function corresponding
 to that list. Each tuple in the input list consists of (i) the coefficient, and (ii) the exponent.*)

 let rec polynomial a = fun n ->
  match a with
  | [] -> 0
  | (b, c)::tail -> let remaining = polynomial tail in
      let x = pow n c in (*Used pow function in Q1*)
      (b * x) + (remaining n);;

let f = polynomial [3, 3; -2, 1; 5, 0];;

print_string("Q9:  ");; print_string("let f = polynomial ");; print_string("[3, 3; -2, 1; 5, 0]");; print_string(" -> ");;(*Dont have proper print functrion*)
print_int(f 2);;
print_endline(" ");;

(*Q10 The power set of a set S is the set of all subsets of S (including the empty set and the entire set).
Write a function powerset of the type 'a list -> 'a list list, which treats lists as unordered sets,
and returns the powerset of its input list. You may assume that the input list has no duplicates.*)

(*Q10*)
let rec powersetHelper f list =
  match list with
  | [] -> []
  | h::t -> (f h) :: (powersetHelper f t);;

let rec powerset list =
  match list with
  | [] -> [[]]
  | h :: t ->
      let result = powerset t in
      result @ powersetHelper (fun s -> h :: s) result
;;

powerset [3; 4; 10];;

print_string("Q10:  ");; printIntList([3; 4; 10]);; print_string(" -> ");;
print_string("Dont have prper print return function");;
print_endline(" ");;