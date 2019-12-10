open Array ;;

let matrix = [|[|0;1;0;0;1;0|];
               [|1;0;1;0;1;0|];
               [|0;1;0;1;0;0|];
               [|0;0;1;0;1;1|];
               [|1;1;0;1;0;0|];
               [|0;0;0;1;0;0|]|] ;;
(* №1 *)
let count mx = let rec f n c1 = let rec g m c2 =
    if m = length (mx.(0))-1 then c2 else g (m+1) (c2+(mx.(n)).(m)) in
    if n = length mx-1 then c1 else f (n+1) (c1+g 0 0) in f 0 0 ;;
(* №3 *)
let amount mx i =
    let rec f1 n c1 = if n = length mx-1 then c1 else f1 (n+1) (c1+(mx.(n)).(i)) in
    let rec f2 m c2 = if m = length (mx.(0))-1 then c2 else f2 (m+1) (c2+(mx.(i)).(m)) in (f1 0 0, f2 0 0) ;;
        (* fst - входящих, snd - исходящих *)
(* №2 *)
let incoming mx = let rec f n = if n = length (mx.(0))-1 then [] else if fst (amount mx n)=0 then (fst (amount mx n))::(f (n+1)) else f (n+1)
    in of_list (f 0) ;;

let rec (^^) a b =
	match b with
	| 0 -> 1
	| b -> a * ((^^) a (b-1)) ;;

let rec power n  g =
	match n with
	| 1 -> [1]
	| n -> (power (n-1) g) @ [g ^^ (n-1)] ;;
(* №4 *)
let rec translater l y = (* из n-ричной в десятичную *)
	match l with
	| [] -> 0
	| a :: b -> ((List.hd (List.rev (power (List.length l) y))) * a) + (translater b y) ;;
(* №5 *)
let rec sistem a n =	(* из десятичной в n-ричную *)
	match a with
	| 1 -> [1]
	| a -> (sistem (a/n) n) @ [a mod n] ;;
