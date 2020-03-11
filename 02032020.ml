type lambda = Var of string | Ayy of lambda*lambda | Abs of string*lambda ;;

let rec list_to_string l = match l with
    | [] -> ""
    | s :: sh -> s ^ (list_to_string sh) ;;

let rec string_from_to str x y = let a = ref "" in
    for i = 0 to (String.length str)-1 do
        if x <= i && y > i then a := !a^(String.make 1 (str.[i]))
    done;
    !a ;;

let rec rep a b l = match l with
    | Var x -> if x = a then Var b else Var x
    | Ayy (x,y) -> Ayy(rep a b x,rep a b y)
    | Abs (x,k) -> Abs((if x = a then b else x), rep a b k) ;;

let print_bool b =
    if b
    then print_string "True\n"
    else print_string "False\n" ;;

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

let r = ref 0 ;;

let rec new_variable l = match l with
    | Var x -> r := !r+1
    | Ayy (x,y) -> new_variable x; new_variable y
    | Abs (x,l) -> r:= !r+1; new_variable l ;;

let unic_variable l = r:=0; new_variable l; "."^(string_of_int (!r)) ;;


let rec alpha_eq x y= match x with
    | Var a ->
        if y = Var a
        then true
        else false
    | Ayy (a,b) ->  (match y with
		| Ayy (c,d) ->
            if alpha_eq a c && alpha_eq b d
            then true
            else false
		| _-> false)
    | Abs (a,l) -> (match y with
		| Abs (b,k) ->
            if alpha_eq (rep a (unic_variable l) l) (rep b (unic_variable k) k)
            then true
            else false
		| _-> false) ;;

let check_alpha_eq s t =
    if (alpha_eq s t)
    then print_string "True\n"
    else print_string "False\n";;


(*print_lambda (Ayy (Var "x", Abs ("y", Ayy (Var "z", Abs ("y", Var "x"))))) ;;
print_string "\n" ;;*)
(*check_alpha_eq (Var "x") (Var "x") ;;*)
