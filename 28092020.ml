type morse = Star | ThreeStars | Space | ThreeSpaces | NineSpaces ;;

let rec razbor s = if s = "" then [] else let n = String.length s in match s.[0] with
    | '*' -> if n > 2 && s.[1] = '*' && s.[2] = '*'
             then [ThreeStars] @ (razbor (String.sub s 3 (n-3)))
             else
                if n = 1
                then [Star]
                else [Star] @ (razbor (String.sub s 1 (n-1)))
    | ' ' -> if n > 8 && List.for_all (fun c -> c=' ') (List.init 8 (fun i -> s.[i+1]))
             then [NineSpaces] @ (razbor (String.sub s 9 (n-9)))
             else
                 if n > 2 && s.[1] = ' ' && s.[2] = ' '
                 then [ThreeSpaces] @ (razbor (String.sub s 3 (n-3)))
                 else
                    if n=1
                    then [Space]
                    else [Space] @ (razbor (String.sub s 1 (n-1)))
    | _ -> failwith "Inalid morse char" ;;

let print_morse s =
List.iter (fun x -> match x with
    | Star -> print_string "*\n"
    | ThreeStars -> print_string "***\n"
    | Space -> print_string " \n"
    | ThreeSpaces -> print_string "   \n"
    | NineSpaces -> print_string "         \n"
    ) (razbor s) ;;

let print_morse_list l =
List.iter (fun x -> match x with
    | Star -> print_string "* "
    | ThreeStars -> print_string "*** "
    | Space -> print_string " "
    | ThreeSpaces -> print_string "   "
    | NineSpaces -> print_string "         "
    ) l ;;

let hash1 = Hashtbl.create 100 ;;
let hash2 = Hashtbl.create 100 ;;
let hash3 = Hashtbl.create 100 ;;

let morse_rus = [
    ([Star; ThreeStars],"А");
    ([ThreeStars; Star; Star; Star],"Б");
    ([Star; ThreeStars; ThreeStars],"В");
    ([ThreeStars; ThreeStars; Star],"Г");
    ([ThreeStars; Star; Star],"Д");
    ([Star],"Е");
    ([Star; Star; Star; ThreeStars],"Ж");
    ([ThreeStars; ThreeStars; Star; Star],"З");
    ([Star; Star],"И");
    ([Star; ThreeStars; ThreeStars; ThreeStars],"Й");
    ([ThreeStars; Star; ThreeStars],"К");
    ([Star; ThreeStars; Star; Star],"Л");
    ([ThreeStars; ThreeStars],"М");
    ([ThreeStars; Star],"Н");
    ([ThreeStars; ThreeStars; ThreeStars],"О");
    ([Star; ThreeStars; ThreeStars; Star],"П");
    ([Star; ThreeStars; Star],"Р");
    ([Star; Star; Star],"С");
    ([ThreeStars],"Т");
    ([Star; Star; ThreeStars],"У");
    ([Star; Star; ThreeStars; Star],"Ф");
    ([Star; Star; Star; Star],"Х");
    ([ThreeStars; Star; ThreeStars; Star],"Ц");
    ([ThreeStars; ThreeStars; ThreeStars; Star],"Ч");
    ([ThreeStars; ThreeStars; ThreeStars; ThreeStars],"Ш");
    ([ThreeStars; ThreeStars; Star; ThreeStars],"Щ");
    ([ThreeStars; ThreeStars; Star; ThreeStars; ThreeStars],"Ъ");
    ([ThreeStars; Star; ThreeStars; ThreeStars],"Ы");
    ([ThreeStars; Star; Star; ThreeStars],"Ь");
    ([Star; Star; ThreeStars; Star; Star],"Э");
    ([Star; Star; ThreeStars; ThreeStars],"Ю");
    ([Star; ThreeStars; Star; ThreeStars],"Я")] ;;

let eng = ["A"; "B"; "W"; "G"; "D"; "E"; "V"; "Z"; "I"; "J"; "K"; "L";
"M"; "N"; "O"; "P"; "R"; "S"; "T"; "U"; "F"; "H"; "C"; "_"; "_"; "Q"; "_"; "Y"; "X"; "_"; "_"; "_"] ;;

for i = 0 to 31 do
    Hashtbl.add hash1 (fst (List.nth morse_rus i)) (snd (List.nth morse_rus i))
    done ;;

for i = 0 to 31 do
    Hashtbl.add hash2 (fst (List.nth morse_rus i)) (List.nth eng i)
    done ;;

for i = 0 to 31 do
    Hashtbl.add hash3 (List.nth eng i) (fst (List.nth morse_rus i))
    done ;;

let rec lang lm buf hash = match lm with
    | [] -> Hashtbl.find hash buf
    | Space :: b -> lang b buf hash
    | ThreeSpaces :: b -> (Hashtbl.find hash buf)^(lang b [] hash)
    | NineSpaces :: b -> " "^(lang b [] hash)
    | a :: b -> lang b (buf @ [a]) hash ;;

let rus m = lang (razbor m) [] hash1 ;;
let eng m = lang (razbor m) [] hash2 ;;
(*
print_string (rus "* *** *** *   * ***   *** *** *** ***   * ***") ; print_newline () ;;
print_string (eng "* *** *** *   * ***   * * *   * * * *   * ***") ; print_newline () ;;
*)

let rec text_to_morse s = if s = "" then [] else match s.[0] with
    | ' ' -> [NineSpaces] @ (text_to_morse (String.sub s 1 (String.length s -1)))
    | _ -> if String.length s = 1 then (Hashtbl.find hash3 (String.make 1 (Char.uppercase_ascii s.[0]))) @ (text_to_morse (String.sub s 1 (String.length s -1)))
    else (Hashtbl.find hash3 (String.make 1 (Char.uppercase_ascii s.[0]))) @ [ThreeSpaces] @ (text_to_morse (String.sub s 1 (String.length s -1))) ;;

(*print_morse_list (text_to_morse (String.uppercase_ascii "Pavel")) ;;*)

let rec int_of_string = function
    | "" -> 0
    | s -> let n = String.length s in int_of_char (s.[n-1]) + ((int_of_string (String.sub s 0 (n-1)))*256) ;;
