(defn iota [t nxt stop y]
  (take-while stop (iterate #(t (nxt %)) y)))

(iota identity inc #(< % 10) 1)

(def upto (fn [end start]
            (iota identity inc #(< % end) start)))

(def downto (fn [end start]
              (iota identity dec #(> % end) start)))

(upto 10 1)
(downto 10 20)

(defn to [start end]
  (if (<= start end)
    (upto end start)
    (downto end start)))

(to 10 20)
(to 20 10)
(to 5 -5)
