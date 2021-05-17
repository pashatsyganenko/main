(* Задача 1 *)
(* формула: mn(m+1)(n+1)/4 *)
let (m,n) = (3,4) ;;

let l = ref [] ;;

let rec find l a = match l with
	| [] -> false
	| x :: y -> if x=a then true else find y a ;;

for i=0 to m do
	for j=0 to n do
		for a=0 to m do
			for b=0 to m do
				if (a <> i) && (b <> j) then (
				if not (find !l ((min a i, min b j),(max a i, max b j))) then l := ((min a i, min b j),(max a i, max b j)) :: !l
				)
			done
		done
	done
done ;;

(* Печать *)
(*print_int (List.length !l) ;; print_newline () ;;
print_int ((n*m*(n+1)*(m+1))/4) ;; print_newline () ;;

if List.length !l = (n*m*(n+1)*(m+1))/4 then print_string "true" else print_string "false" ;; print_newline () ;;*)



(* Задача 2 *)
(* а *)
(* на первой позиции может стоять k цветов, на второй - k-1, на третьей - k-1, ..., на n-ой - k-1 *)
(* поэтому формула будет следующая: k(k-1)^(n-1) *)
(* Во всех случаях k<n, k=n, k>n формула будет та же, и программа тоже *)

let (k,m) = (3,4)

let rec add l n = let g = ref [] in
    for i=1 to n do
        g := !g @ [l @ [i]]
    done; !g ;;

(* цвета мыслим как числа от 1 до k *)
(* создаём список из всех списков длиной n, на каждой позиции которых могут стоят числа от 1 до k *)
let rec make l c k n =
    if c=n then l else
    let r = ref [] in
    for i=0 to List.length l -1 do
        r := !r @ (add (List.nth l i) k)
    done; make !r (c+1) k n ;;

(* функция, проверяющая, что в списке нет одинаковых соседних элементов *)
let rec check l =
    match l with
    | [] -> true
    | [a] -> true
    | a :: b :: c -> if a=b then false else check (b :: c) ;;

(* Выбираем из списов, полученных make те, в которых нет одинаковых соседних элементов *)
let rec chs l = match l with
    | [] -> []
    | a :: b -> if check a then a :: (chs b) else chs b ;;

(* возведение в степень *)
let rec power a b = if b=0 then 1 else a * (power a (b-1)) ;;

(* печать *)
(*print_int (List.length (chs (make [[]] 0 k n)));; print_newline () ;;
print_int (k*(power (k-1) (n-1)));; print_newline () ;;

if List.length (chs (make [[]] 0 k n)) = k*(power (k-1) (n-1)) then print_string "true" else print_string "false" ;; print_newline () ;;*)

(* б *)





(* Задача 3 *)
(* В общем случае задача сводится к следующей: сколько слов можно составить из букв a1, a2, ..., am,
если ai встречается ki раз.
n = k1 + k2 + ... + km
Тогда a1 можно поставить C из n по k1, a2 -  C из n-k1 по k2, ..., am - C из n-k1-k2-...-k(m-1) по km.
Значит слов получится (С из n по k1)*(C из n-k1 по k2)*...*(C из n-k1-k2-...-k(m-1) по km) *)
let s = "test" ;;

let rec fact n = if n=0 then 1 else n * (fact (n-1)) ;;
let c n k = (fact n)/((fact k)*(fact (n-k))) ;;

let rec count l x = match l with
    | [] -> 0
    | a :: b -> if a=x then 1 + (count b x) else count b x ;;

let l = ref [] ;; (* [a1, a2, ..., am] *)
let ss = ref [] ;; (* строка s как список *)
let q = ref [] ;; (* [k1, k2, ..., km] *)

for i=0 to String.length s -1 do
    ss := !ss @ [s.[i]];
    if count !l (s.[i]) = 0 then l := s.[i] :: !l
done ;;


for i=0 to List.length !l -1 do
    q := !q @ [count !ss (List.nth !l i)]
done ;;

let rec sum e = match e with
    | [] -> 0
    | a :: b -> a + (sum b) ;;

let rec w i x = if i = List.length !l then 1 else (c x (List.nth !q i)) * (w (i+1) (x-(List.nth !q i))) ;;

let u = w 0 (sum !q) -1 ;; (* -1, так как изначальная строка не считается *)

(* теперь проверяем результат *)
let rec interleave x lst =
    match lst with
    | [] -> [[x]]
    | a :: b -> (x :: lst) :: (List.map (fun y -> a :: y) (interleave x b)) ;;

let rec permutations lst =
    match lst with
    | a :: b -> List.concat (List.map (interleave a) (permutations b))
    | _ -> [lst] ;;

let p = permutations (List.init (String.length s) (fun x -> x)) ;;

let rec mk st per = match per with
    | [] -> ""
    | a :: b -> (String.make 1 (st.[a]))^(mk st b) ;;

let d = ref [] ;;

for i=0 to List.length p -1 do
    d := (mk s (List.nth p i)) :: !d
done ;;

let find l x = List.for_all (fun y -> y <> x) l ;;

let lk = ref [] ;;

for i=0 to List.length !d -1 do
    if (find !lk (List.nth !d i)) && ((List.nth !d i) <> s) then lk := (List.nth !d i) :: !lk
done ;;

(* печать *)
(*print_int u ;; print_newline () ;;
print_int (List.length !lk);; print_newline () ;;

if u = List.length !lk then print_string "true" else print_string "false" ;; print_newline () ;;*)
(* задача 3а - частный случай того, что написано выше *)



(* Задача 5 *)
(* Функцию f : M -> N можно мыслить парами (x,f(x)), где x из M
поэтому функций будет n^m *)

let (set_m,set_n) = ([1;2;3],[6;7;1]) ;;
let (m,n) = (List.length set_m,List.length set_n) ;;

(* эти функции можно мыслить списаками, в которых i-ый элемент - порядковый номер образа i-ого элемента M *)
let rec addition a l = match l with
    | [] -> []
    | [[]] -> [[a]]
    | x :: y -> (a :: x) :: (addition a y) ;;

let rec functions c = if c=m then [[]] else
    let r = ref [] in
    for i=0 to n-1 do
        r := !r @ (addition i (functions (c+1)))
    done; !r ;;

(* печать *)
(*всех функций: List.iter (fun x -> print_string "["; List.iter (fun y -> print_int y; print_string "";) x; print_string "]";) (functions 0) ;;*)
(*print_int (List.length (functions 0));; print_newline () ;;
print_int (power n m);; print_newline () ;;

if List.length (functions 0) = power n m then print_string "true" else print_string "false" ;; print_newline () ;;*)
