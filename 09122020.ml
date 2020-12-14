type 'a tree = Leaf | Node of ('a tree) * ('a tree) * 'a ;;

(* Дерово отрезков *)

let rec sum t = match t with
    | Node (t1,t2,(k,x)) -> sum t1 + sum t2 + x
    | Leaf -> 0 ;;

let rec tree_line t = match t with
    | Node (t1,t2,(k,x)) -> Node (tree_line t1, tree_line t2, (k,x,sum t1 + sum t2 + x))
    | Leaf -> Leaf ;;
