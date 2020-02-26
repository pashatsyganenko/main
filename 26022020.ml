let rec pos = function
    | [] -> []
    | [a] -> [a]
    | a :: b :: c -> if a < b then a :: (pos (b :: c)) else [a] ;;

let print_l l = List.iter (fun y -> print_int y; print_string " ") l ;;

let rec count l = match l with
    | [] -> []
    | a :: b -> (List.length (pos l)) :: (count b) ;;

let rec list_max l = match l with
    | [] -> failwith ""
    | [a] -> a
    | a :: b :: c -> list_max ((max a b) :: c) ;;

let rec find_list l c = match l with
    | [] -> []
    | a :: b -> if List.length (pos l) = c then pos l else find_list b c ;;

let main l = find_list l (list_max (count l)) ;;

print_l (main [1;4;2;7;5;9;18]) ;;
