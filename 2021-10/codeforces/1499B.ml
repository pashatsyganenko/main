    let n = read_int ()
     
    let rec find a b i m = if i>m-2 then -1 else if String.sub a i 2 = b then i else find a b (i+1) m ;;
     
    for i=1 to n do
        let s = read_line () in
        let z = String.length s in
        let t = find s "11" 0 z in
        if t = -1 then print_string "YES\n" else
        if find (String.sub s t (z-t)) "00" 0 (z-t) = -1 then print_string "YES\n" else print_string "NO\n"
    done
