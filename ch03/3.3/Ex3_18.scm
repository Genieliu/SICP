(define (loop? x)
  (let ((count '()))
    (define (help x)
      (if (not (pair? x))
          '#f
          (if (inlist? x count)
              '#t
              (begin (set! count (cons x count))
                     (help (cdr x))))))
    (help x)))

(define (inlist? x pairs)
  (if (null? pairs)
      '#f
      (if (eq? x (car pairs))
          '#t
          (inlist? x (cdr pairs)))))
;;Test
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
      
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))
;(define test (cons (car z) '()))
;(define last (cddr z))
;(eq? (cdr last) z)
(define kk '(a b c))
;(loop? z)
;(define x '(a b c))
;(loop? x)
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
