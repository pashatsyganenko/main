type lambda = Var of string | Ayy of lambda*lambda | Abs of string*lambda ;;

let rec list_to_string l = match l with
    | [] -> ""
    | s :: sh -> s ^ (list_to_string sh) ;;

let rec string_from_to str x y = let a = ref "" in
    for i = 0 to (String.length str)-1 do
        if x <= i && y > i then a := !a^(String.make 1 (str.[i]))
    done;
    !a ;;


let rec razbor str = if str.[0] = '(' then
        if str.[1] = '$'
        then
            let l = String.split_on_char '.' str in
            Abs (string_from_to (List.hd l) 2 (String.length (List.hd l)),
                razbor (string_from_to (list_to_string (List.tl l)) 0 ((String.length (list_to_string (List.tl l)))-1)))
        else
            let l = String.split_on_char ' ' str in
                Ayy ( razbor (string_from_to (List.hd l) 1 (String.length (List.hd l))),
                    razbor (string_from_to (list_to_string (List.tl l)) 0 ((String.length (list_to_string (List.tl l)))-1)))

    else
        Var str ;;

let rec print_lambda lam = match lam with
    | Var s -> print_string s
    | Ayy (l1,l2) -> print_string "("; print_lambda l1; print_string " "; print_lambda l2; print_string ")"
    | Abs (s,l) -> print_string ("(\\" ^ s ^ "."); print_lambda l; print_string ")" ;;

