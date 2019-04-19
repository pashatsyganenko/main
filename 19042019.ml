let bambuk m = let rec help n = if n<=0 then Leaf else Node (m-n+1, Leaf, help (n-1)) in help m ;;
