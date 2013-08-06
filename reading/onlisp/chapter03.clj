; Chapter 3 was a relatively short chapter (code-wise).  It dealt mostly with side-effects and the virtues of a more functional style to avoid such evil.  Thankfully, Clojure eliminates many of the problems outlined by Graham in the way that it prefers immutability and minimizes the functions causing side-effects.

; pg. 29

;  Graham provides an intentionally bad implementation of a reverse function that modifies a list in place.  To do this in Clojure would require some gymnastics and therefore is probably not worth the effort.

; pg. 30

;<pre lang="lisp">

(defn good-reverse [lst]
  (defn rev [lst acc]
    (if (nil? lst)
      acc
      (rev (rest lst) (cons (first lst) acc))))
  (rev lst nil))

;</pre>

; pg. 32

;  Clojure doesn't provide multiple value bindings in the same way that Lisp does.  Instead, you can construct a vector of values and then deconstruct them easily on the return within a let)

;<pre lang="lisp">

(defn mytrunc [num]
  [(int num) (- num (int num))])

(let [[int_part frac_part] (mytrunc 26.21875)]
  (str int_part " and " frac_part))

;</pre>

; -m