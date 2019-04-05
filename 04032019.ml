let rec buildx n s m = if n<=0 then s else buildx (n-1) (s^(String.make m ' ')^"*\n") (m+1) ;;
let rec buildy n s = if n <=0 then s else buildy (n-1) (s^(String.make n ' ')^"*\n") ;;
let build n = (buildx n "" 0)^(buildy (n-2) "") ;;

print_string (build 40)

let rec repeat str n s = if n<=0 then s else repeat str (n-1) (str^s) ;;

let draw_quad n = if n=0 then "" else if n=1 then "*" else (String.make n '*')^"\n"^(repeat ("*"^(repeat " " (n-2) "")^"*\n") (n-2) "")^(String.make n '*')^"\n" ;;

print_string (draw_quad 8);;
