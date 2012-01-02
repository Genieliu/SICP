(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))



(define (estimate-integral formular x1 x2 y1 y2 trials)
  (define (iter trials-left trials-pass)
    (cond ((= trials-left 0) (/ trials-pass trials))
	  ((formular (random-in-range x1 x2) (random-in-range y1 y2))
	   (iter (- trials-left 1) (+ trials-pass 1)))
	  (else
	   (iter (- trials-left 1) trials-pass))))
  (* (- x2 x1) (- y2 y1) (iter trials 0)))

;;Test
(define (circular-one x y)
  (< (+ (* x x)
	(* y y))
     1))

(estimate-integral circular-one -2.0 2.0 -2.0 2.0 1000000)
