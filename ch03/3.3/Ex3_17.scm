(define (count-pairs x)
  (let ((initial '()))
    (define (iter x) 
      (if (or (not (pair? x)) (inlist? x initial))
          0
          (begin (set! initial (cons x initial))
                 (+ 1 (iter (car x)) (iter (cdr x))))))
    (iter x)))
  
(define (inlist? x pairs)
  (if (null? pairs)
      '#f
      (if (eq? x (car pairs))
          '#t
          (inlist? x (cdr pairs)))))


            
