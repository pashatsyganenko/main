type regexp = Concat of regexp*regexp | Alt of regexp*regexp | Char of char | Empty ;;

let str = "(a|b)c" ;;
let pos = ref 0 ;;

let rec parse_s () =
    if !pos >= String.length str then Empty else
    let t = parse_t () in
    if !pos < String.length str && str.[!pos] = '|' then (pos := !pos + 1; Alt (t, parse_s ()))
    else t
        and parse_t () =
            match str.[!pos] with
            | '(' -> pos := !pos + 1;
                let s' = parse_s () in
                    (if str.[!pos] <> ')' then failwith "error");
                    (pos := !pos + 1; Concat (s', parse_t ()))
            | ')' | '|' -> Empty
            | _ -> pos := !pos + 1; Char (str.[!pos-1]) ;;

let rec print_regexp reg = match reg with
    | Concat (a,b) -> print_string "Concat ("; print_regexp a; print_string ", "; print_regexp b; print_string ")"
    | Alt (c,d) -> print_string "("; print_regexp c; print_string " | "; print_regexp d; print_string ")"
    | Char c -> print_char c
    | Empty -> () ;;

print_regexp (parse_s ()) ;;
