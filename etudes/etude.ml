print_endline "+-----------------------+";;
print_endline "|         les           |";;
print_endline "|        etudes         |";;
print_endline "|        d'ocaml        |";;
print_endline "+-----------------------+";;

(* just a test from wikipedia *)
let rec sum xs =
  match xs with
    | []       -> 0
    | x :: xs' -> x + sum xs'
  ;;

(* print functions from
 * http://www.mail-archive.com/caml-list@yquem.inria.fr/msg00676.html
 *)

open Format;;
let rec fprintfs sep f ff = function
    | [] -> ()
    | [h] -> fprintf ff "%a" f h
    | h::t -> fprintf ff "%a%a%a" f h sep () (fprintfs sep f) t
  ;;

let fprintf_mma ff list =
    let sep ff () = fprintf ff ",@ " in
    let int ff = fprintf ff "%d" in
    fprintf ff "{@[%a@]}" (fprintfs sep int) list
  ;;

print_int (sum [1;2;3]) ;;
print_newline ;;

(*
 * primitives
 *)

let pp = function
  a -> fprintf std_formatter "%a\n" fprintf_mma a 
  ;;

let first = function 
    x::_ -> x
  | _    -> failwith "empty!"
  ;;

let l = [1;2;3];;
let r = [4;5;6];;

print_int (first l);;

let rest = function 
    _::xs -> xs
  | _     -> failwith "empty!"
  ;;

pp (rest l);;

let rec (++) xs ys = match xs with 
    []    -> ys
  | x::xs -> x::(xs ++ ys)
  ;;

pp (l ++ r);;

let rec iterate n x = 
  if n < 1 then
    [] 
  else 
    x::iterate (n-1) x
  ;;

pp (iterate 10 0)

let rec take n xs = 
    if n < 1 then 
      [] 
    else 
      match xs with
  | []    -> []
  | x::xs -> x::take (n-1) xs
  ;;	

let rec drop n xs = 
    if n < 1 then 
      xs 
    else 
      match xs with
 | []    -> []
 | _::xs -> drop (n-1) xs
 ;;

pp (take 2 l);;
pp (drop 2 r);;


let split_at n xs = ((take n xs), (drop n xs));;

pp (fst (split_at 1 (l ++ r)));;
pp (snd (split_at 4 (l ++ r)));;


let rec repeat n x = 
    if n < 1 then 
      [] 
    else 
      x::repeat (n-1) x
 ;;

pp (repeat 4 42);;


let rec repeatedly n f arg = 
    if n < 1 then
      []
    else
      (f arg)::repeatedly (n-1) f arg
;;

let identity n = n;;
let double   n = (n*2);;

print_int (identity 31);;
print_int (double 31);;

pp (repeatedly 5 identity 108);;
pp (repeatedly 5 double 108);;


let rec map1 f = function     
    [] -> []
  | x::xs -> f x::map1 f xs
;;

pp (map1 identity l);;
pp (map1 double l);;


let rec reduce f b = function
    [] -> b
  | h::t -> reduce f (f b h) t
;;

print_int (reduce (fun x lst -> x+1) 0 [1;2;3]);;

let count = reduce (fun x lst -> x+1) 0;;

print_int (count [1;2;3]);;

let rec foldr f b = function     
    [] -> b
  | h::t -> f h (foldr f b t)
;;

let map f = foldr (fun e lst -> (f e)::lst) [];;

pp (map identity l);;
pp (map double l);;

let filter p = foldr (fun e acc -> 
                        if (p e) then 
                          e::acc 
                        else 
                          acc) 
                      [];;

pp (filter (fun e -> e < 3) l)

