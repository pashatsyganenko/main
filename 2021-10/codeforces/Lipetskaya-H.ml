    let split_on_char sep s =
      let r = ref [] in
      let j = ref (String.length s) in
      for i = String.length s - 1 downto 0 do
        if String.unsafe_get s i = sep then begin
          r := String.sub s (i + 1) (!j - i - 1) :: !r;
          j := i
        end
      done;
      String.sub s 0 !j :: !r ;;
     
    let n = read_int () ;;
    let s = read_line () ;;
     
    let l = split_on_char ' ' s ;;
     
    let rec f t n = match t with
      | [] -> []
      | a :: b -> (int_of_string a, n) :: (f b (n+1)) ;;
     
    let c = List.sort (fun (a,b) (x,y) -> compare a x) (f l 0) ;;
     
    let rec g t = match t with
      | [] -> ()
      | [(p,q)] -> print_int (q+1)
      | (a,b) :: c -> print_int (b+1); print_string " "; g c ;;
     
    g c ;;
    print_string "\n" ;;
