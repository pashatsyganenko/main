let rec f sl ps = match sl with
    | [] -> ps
    | a :: b -> if List.exists (fun (k,l) -> k=a) ps = true
                then f b (List.map (fun (p,q) -> if p=a then (p,q+1) else (p,q)) ps)
                else f b (ps @ [(a,1)]) ;;

let main l = if l=[] then ("",0) else List.hd (List.sort (fun x y -> (snd y) - (snd x) ) (f l [])) ;;

let (x,y) = main ["a"; "b"; "b"; "a"; "c"; "a"; "a"; "c"; "c"] in (print_string (x^"\n"); print_int y; print_string "\n") ;;
