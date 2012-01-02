(define (loop? x)
  (let ((count (cdr x)))
    (define (help x)
      (cond ((or (not (pair? (cdr count))) (not (pair? x)))
             '#f)
            ((eq? x count) '#t)
            (else
             (begin (set! count (cdr (cdr count)))
                    (help (cdr x))))))
    (help x)))

;;Test
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define z1 (make-cycle (list 'a 'b 'c)))
(define z2 (cons 'q z1))

(loop? z1)
;Value: #t
(loop? z2)
;Value: #t
(loop? (make-cycle '(a)))
;Value: #t
(loop? (list 'a 'b (make-cycle '(1 2 3 4)) 'c))
;Value: #f
