type lambda = Var of string | App of lambda*lambda | Abs of string*lambda ;;

let beta_redex x = match x with
    | App ((Abs (x,y)),z) -> true
    | _ -> false ;;

let rec count_beta_redex lam = match lam with
    | Var s -> 0
    | App ((Abs (x,y)),z) -> 1 + (count_beta_redex y) + (count_beta_redex z)
    | App (a,b) -> (count_beta_redex a) + (count_beta_redex b)
    | Abs (str,l) -> count_beta_redex l ;;
