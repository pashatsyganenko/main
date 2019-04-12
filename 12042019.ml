type tree = Node of int*tree*tree | Leaf ;;
let t = Node (2,Node (1,Leaf,Leaf), Node (3, Leaf, Leaf)) ;;

let rec upor tree = match tree with
	| Leaf -> true
	| Node (x,t1,t2) -> match (t1,t2) with
		| (Leaf,Leaf) -> true
		| (Leaf, Node (y,t3,t4)) -> if x<y then upor (Node (y,t3,t4)) else false
		| (Node (z,t5,t6), Leaf) -> if x>z then upor (Node (z,t5,t6)) else false
		| (Node (a,t7,t8), Node (b,t9,t10)) -> if x>a && x<b then upor (Node (a,t7,t8)) && upor (Node (b,t9,t10)) else false ;;
