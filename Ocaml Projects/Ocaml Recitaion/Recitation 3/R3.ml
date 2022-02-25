(* Suppose a weighted undirected graph (where each vertex has a String name) is represented by a list
of edges, with each edge being a tuple of type String * String  * int. Write a Ocaml function to identify
the minimum-weight edge in this graph. Use pattern matching to solve this problem*)

(*list == graph(vertex's) vertex's == edges  edges== tuples*)

(*edge = (vertex from, vertex too, weight)*)

let e01 = ("0","1",2);;
let e10 = ("1","0",2);;
let e02 = ("0","2",8);;
let e20 = ("2","0",8);;
let e12 = ("1","2",10);;
let e21 = ("2","1",10);;

(*vertex = (all edges, all edges,)*)

let v0 = [e01,e02];;
let v1 = [e10,e12];;
let v2 = [e20,e21];;

let graph = [v0,v1,v2];;

let smallest_weight (list): int=
  match list with
  |[] -> 0
  |h::t -> IDK. . . .contents
  
  (*recursively traverse down the levels of the graph (graph -> vertex -> edge -> weight) and compare the weight to fiund the lowest weight*)

print_int(smallest_weight graph);;