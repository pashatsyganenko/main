let alpha m n = let x = ref 0 in
    for i=m to n do
        let b = ref true in
            if i=1 then b := false;
            for j=2 to i-1 do
                if i mod j = 0 then
                    b := false
                done;
            if !b then x := !x + 1
    done ; (float_of_int !x) /. (float_of_int (n-m+1)) ;;



let read_file name = let rec read_file_impl f =
	try
		let u = input_line f in [u] @ (read_file_impl f)
	with
		End_of_file -> [] in
        let f = open_in name in
        let contents = read_file_impl f in
        close_in f;
        contents ;;

let rec split l = match l with
    | [] -> []
    | a :: b -> (String.split_on_char ' ' a) @ (split b) ;;

let rec sl_length = function
    | [] -> 0
    | a :: b -> (String.length a) + sl_length b ;;

let files = ["a.txt"; "b.txt"; "c.txt"; "d.txt"; "e.txt"] ;;

let beta () = let x = ref 0. in
    let n = List.length files in
    for i=0 to n-1 do
        (*let l = split (read_file ("Desktop/OCaml/"^file)) in*)
        x := !x +. (float_of_int (sl_length (split (read_file ("Desktop/OCaml/Texts/"^(List.nth files i)))))) /. (float_of_int n)
    done; !x ;;

let gamma filename = let f = split (read_file filename) in
    let x = ref 0. in let n = List.length f in
    for i=0 to n-1 do
        x := !x +. ((float_of_int (String.length (List.nth f i))) /. (float_of_int n))
    done; !x ;;
