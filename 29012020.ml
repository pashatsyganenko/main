let print_list l = print_string "["; List.iter (fun x -> print_int x; print_string "; ") l; print_string "\b\b]\n" ;;

let rec step n m h =
    if n>0 then
        for i=1 to m do
            step (n-i) i (i :: h)
        done
    else if n=0 then print_list h ;;

let k = 20 ;;
step k k [] ;;
