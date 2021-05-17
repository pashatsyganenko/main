(* Задача 3 *)
let n = 5 ;;
(* n-ое число Фибоначчи *)
let rec fib n f1 f2 = if n=0 then f1 else fib (n-1) f2 (f1+f2) ;;
(* итоговое количество последовательностей *)
let c = fib (n+1) 1 1 ;;


(* Задача 4 *)
(* ищем число разбиений n числами меньшими или равными k *)
let (n,k) = (5,5) ;;
(* массив, где на пересечении i-ого столбца и j-ой строки стоит число разбиений i+1 числами меньшими или равными j+1 *)
let m = ref (List.init k (fun i -> List.init n (fun j -> if i=0 || j=0 then 1 else 0))) ;;

let add l a b w = List.mapi (fun j x -> List.mapi (fun i y -> if (i,j)=(a,b) then w else y ) x) l ;;

let mth l i j = List.nth (List.nth l j) i ;;

for j=1 to k-1 do
    for i=1 to n-1 do
        let x = i-j in
        if x<0 then
        m := add !m i j (mth !m i (j-1))
        else if x=0 then m := add !m i j ((mth !m i (j-1))+1)
        else m := add !m i j ((mth !m i (j-1))+(mth !m (x-1) j))
    done
done ;;
(*
List.iter (fun a -> List.iter (fun b -> print_int b; print_string "; ") a; print_string "\n") !m ;;
*)
print_int (mth !m (n-1) (k-1)) ;;

(*
  1 2 3 4 5 6
1 1 1 1 1 1 1
2 1 2 2 3
3 1
4 1
5 1
*)




(* Задча 5 *)
(* !!!!!!!!!
НЕ ТО
!!!!!!!!! *)
let sequence = [1;2;3;2;3] ;;

(* находим все возрастающие последовательности *)
let rec find_all l p buf = match l with
    | [] -> p
    | [a] -> (buf @ [a]) :: p
    | a :: b :: c -> if a <= b then find_all (b :: c) p (buf @ [a]) else find_all (b :: c) ((buf @ [a]) :: p) [] ;;

(* находим самую длинную *)
let rec find_longest p (len,buf) = match p with
    | [] -> (len,buf)
    | a :: b -> if List.length a > len then find_longest b (List.length a,a) else find_longest b (len,buf) ;;

(* итоговая последовательность *)
let longest_subsequence = snd (find_longest (find_all sequence [] []) (0,[]))
