type 'a tree = Leaf | Node of ('a tree) * ('a tree) * 'a ;;

let rec is_bamboo t = match t with
    | Node (Node (tr1, tr2, a), Leaf, b) -> is_bamboo (Node (tr1, tr2, a))
    | Node (Leaf, Node (tr1, tr2, a), b) -> is_bamboo (Node (tr1, tr2, a))
    | Leaf -> true
    | _ -> false ;;

let rec min_max_depth tree = match tree with
    | Node (tr1, tr2, r) -> let ((a,b),(c,d)) = (min_max_depth tr1, min_max_depth tr2) in ((min a c)+1, (max b d)+1)
    | Leaf -> (0,0) ;;

let is_balanced tree = let (x,y) = min_max_depth tree in y-x < 2 ;;

let rec make_bamboo n = if n=0 then Leaf else Node ((make_bamboo (n-1)), Leaf, 0) ;;

let rec full_tree k = if k = 0 then Leaf else Node (full_tree (k-1), full_tree (k-1), 0) ;;

let rec find tr depth d = match tr with
    | Leaf -> if d=depth then true else false
    | Node (tr1, tr2, a) -> (find tr1 depth (d+1)) || (find tr2 depth (d+1)) ;;

let rec string_of_tree tree = match tree with
    | Leaf -> "Leaf"
    | Node (tr1, tr2, a) -> "Node (" ^ (string_of_tree tr1) ^ ") (" ^ (string_of_tree tr2) ^ ") " ^ (string_of_int a) ;;

let make_tree_min_max (m,n) = let rec h t = match t with
    | Node (t1,t2,a) -> Node (t1, h t2, a)
    | Leaf -> full_tree (n-m)
        in h (full_tree m) ;;


let make_tree l =
    let rec f l g = match l with
    | [] -> []
    | a :: b -> (a-g) :: (f b g) in
    let rec normalizing lst = let rec help h = match h with
        | [] -> []
        | [a] -> [a]
        | a :: b :: c -> if a=b then help (b :: c) else a :: (help (b :: c))
        in help (List.sort compare lst) in
    let rec h tr p = match tr with
    | Leaf -> full_tree p
    | Node (tr1,tr2,o) -> Node (tr1,h tr2 p,o) in
    let rec make_tree_h lst t =
    match lst with
        | [] -> Leaf
        | [a] -> h t a
        | a :: b :: c -> make_tree_h (f (b :: c) a) (h t a)
        in make_tree_h (normalizing l) Leaf ;;
