; Benchmark adapted from "s9.desugared.bpl"

(set-logic NIA)

(synth-inv inv-f ((i Int) (j Int) (k Int) (l Int)))

(declare-primed-var i Int)
(declare-primed-var j Int)
(declare-primed-var k Int)
(declare-primed-var l Int)

(define-fun pre-f ((i Int) (j Int) (k Int) (l Int)) Bool
  (and (= j 0) (= i 0) (>= k 0)))

(define-fun trans-f ((i Int) (j Int) (k Int) (l Int)
                     (i! Int) (j! Int) (k! Int) (l! Int)) Bool
  (and (< j k) (= i! (+ i (* l k))) (= j! (+ j 1)) (= k! k) (= l! l)))

(define-fun post-f ((i Int) (j Int) (k Int) (l Int)) Bool
  (or (< j k) (= i (* l (* k j)))))

(inv-constraint inv-f pre-f trans-f post-f)

(check-synth)