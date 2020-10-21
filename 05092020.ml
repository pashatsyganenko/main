let p1 = 11 ;;
let p2 = 1023 ;;

let hash s =
    let rec h i =
    if i=0 then int_of_char s.[0] else
    ((h (i-1))*p1 + (int_of_char (s.[i]))) mod p2 in h (String.length s -1) ;;

let rec add arr e = if (List.exists (fun u -> u = e) arr.(hash e)) then arr else (arr.(hash e) <- (arr.(hash e) @ [e]); arr) ;;

let get arr e = if (List.exists (fun u -> u = e) arr.(hash e)) then true else false ;;
