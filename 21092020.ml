(* Домашнее задание на 21 сентября 2020 *)

let rec power x n = if n=0 then 1 else x * (power x (n-1)) ;;

(* Первая задача *)

let alpha n o = (* o - окончание квадрата, n - до какого числа *)
    let x = ref 0 in
    let y = ref 0 in
    for i=1 to n do
        if i*i <= n then
        let s = string_of_int (i*i) in
        (if s.[String.length s -1] = o then x := !x + 1);
        y := !y+1
        done; (float_of_int !x) /. (float_of_int !y) ;;

(* Вторая задача *)

let beta n o =
    let x = ref 0 in
    for i=1 to n do
        if (string_of_int i).[0] = o
        then x := !x + 1
    done; (float_of_int !x) /. (float_of_int n) ;;

(* Третья задача *)

let birthday n = let rec f m p =
    if n>0
    then f (n-1) ((float_of_int (m-n)/.365.) +. p -. p *. (float_of_int (m-n)/.365.))
    else p in f n 0. ;;
