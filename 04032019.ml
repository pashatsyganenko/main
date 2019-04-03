let rec repeat str n s = if n=0 then s else repeat str (n-1) (s^str) ;;

let rec buildx n s m = if n=0 then s else buildx (n-1) (s^(String.make m ' ')^"*") (m+1) ;;
