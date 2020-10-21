let alpha l = List.sort (fun x y -> if x<y then 1 else -1) l ;;

let rec beta l s n = match l with
    | [] -> []
    | a :: b -> if a=s then beta b a (n+1) else (s,n) :: (beta b a 1) ;;

let bd = ['.'; ','; ';'; '('; ')'; '['; ']'; '-'; '+'; '='; '!'; '?'; '<'; '>'; '@'; '#'; '$'; '%'; '^'; '&'; '*'; '{'; '}'; '|'; '/'; '~'] ;;

let rec clear s = if s="" then "" else
    if List.exists (fun x -> s.[0]=x) bd then clear (String.sub s 1 ((String.length s)-1)) else (String.make 1 (s.[0]))^(clear (String.sub s 1 ((String.length s)-1))) ;;

let rec split = function
    | [] -> []
    | a :: b -> (List.map clear (String.split_on_char ' ' a)) @ (split b) ;;

let main l = List.sort (fun (a,b) (x,y) -> y-b) (beta (alpha (split l)) "" 0) ;;

let read_file name =
    let rec h f =
    try
        let u = input_line f in [u] @ (h f)
    with
        End_of_file -> [] in
        let f = open_in name in
        let contents = h f in
        close_in f;
        contents;;

(* сколько слов *)
let rec count = function
    | [] -> 0
    | (a,b) :: c -> b + count c ;;

(*print_int (count (main (read_file "Desktop/OCaml/vim.txt"))) ;;*)

let matoz l = let x = ref 0 in let y = ref 0 in
    for i=0 to List.length l -1 do
        let (a,b) = List.nth l i in
        x := !x+(String.length a);
        y := !y+b
        done;
        (float !x) /. (float !y) ;;
(*
(*print_float (matoz (main (read_file "Desktop/OCaml/vim.txt"))) ;;*)
let l = main (read_file "Desktop/OCaml/vim.txt") ;;

for i = 0 to 50 do
    print_string ((fst (List.nth l i))^"  "); print_int (snd (List.nth l i)); print_newline ()
done ;;
*)
let p1 = [' '; ','; ';'; '('; ')'; '['; ']'; '-'; '+'; '='; '<'; '>'; '@'; '#'; '$'; '%'; '^'; '&'; '*'; '{'; '}'; '|'; '/'; '~'] ;;
let p2 = ['.'; '!'; '?'] ;;

(*матожидание длины предложения на разных языках*)
let matoz_sent l =
    let sent_rus = ref 0 in
    let e_rus = ref 0 in
    let sent_fr = ref 0 in
    let e_fr = ref 0 in
    let lan = ref true in
    for i=0 to List.length l -1 do
        let x = List.nth l i in
        for j=0 to String.length x -1 do
            let y = x.[j] in
                if List.exists (fun t -> y=t) p1 then
                    if !lan = true then
                    e_rus := !e_rus + 1 else
                    e_fr := !e_fr + 1
                else if List.exists (fun t -> y=t) p2 then
                    if !lan = true then
                    sent_rus := !sent_rus + 1 else
                    sent_fr := !sent_fr + 1;
                if (int_of_char y >= 65 && int_of_char y <= 90) || (int_of_char y >= 97 && int_of_char y <= 122) then
                lan := false else lan := true
        done
    done;
    ((float !e_rus) /. (float !sent_rus),(float !e_fr) /. (float !sent_fr)) ;; (*первое - по-русски, второе - по-французски*)

(*print_float (fst (matoz_sent (read_file "Desktop/OCaml/vim.txt"))) ;; print_newline () ;;
print_float (snd (matoz_sent (read_file "Desktop/OCaml/vim.txt"))) ;; *)
