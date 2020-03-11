type lambda = Variable of string | Application of lambda*lambda | Abstraction of string*lambda ;;

let rec list_to_string l = match l with
    | [] -> ""
    | s :: sh -> s ^ (list_to_string sh) ;;

let rec string_from_to str x y = let a = ref "" in
    for i = 0 to (String.length str)-1 do
        if x <= i && y > i then a := !a^(String.make 1 (str.[i]))
    done;
    !a ;;

let rec rep a b l = match l with
    | Variable x -> if x = a then Variable b else Variable x
    | Application (x,y) -> Application(rep a b x,rep a b y)
    | Abstraction (x,k) -> Abstraction((if x = a then b else x), rep a b k) ;;

let print_bool b =
    if b
    then print_string "True\n"
    else print_string "False\n" ;;

let rec razbor str = if str.[0] = '(' then
        if str.[1] = '$'
        then
            let l = String.split_on_char '.' str in
            Abstraction (string_from_to (List.hd l) 2 (String.length (List.hd l)),
                razbor (string_from_to (list_to_string (List.tl l)) 0 ((String.length (list_to_string (List.tl l)))-1)))
        else
            let l = String.split_on_char ' ' str in
                Application ( razbor (string_from_to (List.hd l) 1 (String.length (List.hd l))),
                    razbor (string_from_to (list_to_string (List.tl l)) 0 ((String.length (list_to_string (List.tl l)))-1)))

    else
        Variable str ;;

let rec print_lambda lam = match lam with
    | Variable s -> print_string s
    | Application (l1,l2) -> print_string "("; print_lambda l1; print_string " "; print_lambda l2; print_string ")"
    | Abstraction (s,l) -> print_string ("(\\" ^ s ^ "."); print_lambda l; print_string ")" ;;

let r = ref 0 ;;

let rec new_Variableiable l = match l with
    | Variable x -> r := !r+1
    | Application (x,y) -> new_Variableiable x; new_Variableiable y
    | Abstraction (x,l) -> r:= !r+1; new_Variableiable l ;;

let unic_Variableiable l = r:=0; new_Variableiable l; "."^(string_of_int (!r)) ;;


let rec alpha_eq x y= match x with
    | Variable a ->
        if y = Variable a
        then true
        else false
    | Application (a,b) ->  (match y with
		| Application (c,d) ->
            if alpha_eq a c && alpha_eq b d
            then true
            else false
		| _-> false)
    | Abstraction (a,l) -> (match y with
		| Abstraction (b,k) ->
            if alpha_eq (rep a (unic_Variableiable l) l) (rep b (unic_Variableiable k) k)
            then true
            else false
		| _-> false) ;;

let check_alpha_eq s t =
    if (alpha_eq s t)
    then print_string "True\n"
    else print_string "False\n";;


(*print_lambda (Application (Variable "x", Abstraction ("y", Application (Variable "z", Abstraction ("y", Variable "x"))))) ;;
print_string "\n" ;;*)
(*check_alpha_eq (Variable "x") (Variable "x") ;;*)
