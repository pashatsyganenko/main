type tree = Tree of tree list ;;

let check s =
    let c = ref 0 and f = ref true in
    for i = 0 to String.length s -1 do
        if !c<0 then f := false;
        if s.[i] = '(' then c := !c + 1 else c := !c -1
    done; !f ;;

let rec parse s n = if n >= String.length s then ([],n) else
    match s.[n] with
    | '(' -> let (tl,n) = parse s (n+1) in
        if s.[n] = ')' then let (tl2,n) = parse s (n+1) in
        (Tree tl :: tl2,n) else failwith ""
    | _ -> ([],n) ;;

let rec string_of_tree t = match t with
    | [] -> ""
    | Tree a :: b -> "(" ^ (string_of_tree a) ^ ")" ^ (string_of_tree b) ;;

print_string (string_of_tree (fst (parse "()(())()" 0))) ;;
print_newline () ;;

let print_tree lst = let rec help l n = match l with
    | [] -> print_string "*"
    | (Tree []) :: y -> print_string ((String.make n ' ') ^ "+-\n"); help y (n+1)
    | (Tree x) :: y -> print_string ((String.make n ' ') ^ "*\n"); help x n; help y (n-1) in help lst 0 ;;
