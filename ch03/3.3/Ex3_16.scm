(define (count-pairs x)
  (if (not (pair? x))
      0 
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

;;Test
;;7
(define x (list 'a))
(define second (cons x x))
(define first (cons second second))
(count-pairs first)

;;Test
;;3
(define x (list 'a 'b 'c))
(count-pairs x)

;;Test
;;4
(define x (list 'b))
(define z (cons x x))
(define k (cons 'a z))
(count-pairs k)

;;Test
;;Nothing return 
(define z '(a b c))
(set-cdr! (cddr z) z)
(count-pairs z)
