type 'a tree = Leaf | Node of ('a tree) * ('a tree) * 'a ;;

let rec mem tree a = match tree with
    | Leaf -> false
    | Node (tr1, tr2, b) -> if a=b then true else (mem tr1 a) || (mem tr2 a) ;;

let rec add tree a = match tree with
    | Leaf -> Node (Leaf, Leaf, a)
    | Node (tr1, tr2, b) -> if a=b then tree else if a<b then Node (add tr1 a, tr2, b) else Node (tr1, add tr2 a, b) ;;

let h_delete t =
    let rec do_delete t = match t with
    | Leaf -> failwith ""
    | Node (Leaf,r,x) -> (r,x)
    | Node (l,r,x) -> let (l',x') = do_delete l in (Node (l',r,x),x') in
        match t with
        | Leaf -> Leaf
        | Node (Leaf,l,x) -> l
        | Node (r,Leaf,x) -> r
        | Node (l,r,x) -> let (r',x') = do_delete r in Node (l,r',x') ;;

let rec delete t x = match t with
    | Leaf -> failwith ""
    | Node (l,r,a) -> if x=a then h_delete t else if x<a then Node (delete l x,r,a) else Node (l,delete r x,a) ;;

let rec string_of_tree tree = match tree with
    | Leaf -> "Leaf"
    | Node (tr1, tr2, a) -> "Node (" ^ (string_of_tree tr1) ^ ") (" ^ (string_of_tree tr2) ^ ") " ^ (string_of_int a) ;;

let rec list_of_tree t = match t with
    | Leaf -> []
    | Node (t1,t2,x) -> [x] @ (list_of_tree t1) @ (list_of_tree t2) ;;

let rec verify t = match t with
    | Leaf -> true
    | Node (t1,t2,x) -> List.for_all (fun i -> i<x) (list_of_tree t1) && List.for_all (fun i -> i>x) (list_of_tree t2) &&
        verify t1 && verify t2 ;;
