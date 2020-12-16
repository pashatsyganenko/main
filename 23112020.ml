type 'a tree = Leaf | Node of ('a tree) * ('a tree) * 'a ;;

let rec add t (x,a) = match t with
    | Leaf -> Node (Leaf,Leaf,(x,a))
    | Node (l,r,(y,b)) -> if x=y then Node (l,r,(y,a)) else
        if x<y then Node (add l (x,a),r,(y,b)) else Node (l,add r (x,a),(y,b)) ;;

let h_delete t =
    let rec do_delete t = match t with
    | Leaf -> failwith ""
    | Node (Leaf,r,(x,y)) -> (r,x,y)
    | Node (l,r,(x,y)) -> let (l',x',y') = do_delete l in (Node (l',r,(x,y)),x',y') in
        match t with
        | Leaf -> Leaf
        | Node (Leaf,l,(x,y)) -> l
        | Node (r,Leaf,(x,y)) -> r
        | Node (l,r,(x,y)) -> let (r',x',y') = do_delete r in Node (l,r',(x',y')) ;;

let rec delete t x = match t with
    | Leaf -> failwith ""
    | Node (l,r,(a,y)) -> if x=a then h_delete t else if x<a then Node (delete l x,r,(a,y)) else Node (l,delete r x,(a,y)) ;;

let rec find t x = match t with
    | Leaf -> failwith ""
    | Node (l,r,(a,b)) -> if a=x then b else if x<a then find l x else find r x ;;

let rec mem t x = match t with
    | Leaf -> false
    | Node (l,r,(a,b)) -> if a=x then true else if x<a then mem l x else mem r x ;;
