(define (g v)
  (let ((base v))
    (lambda (m)
      (if (= m 0)
	  (begin (set! base 0)
		 base)
	  base))))

(define f (g 1))

;;Test
(+ (f 0) (f 1)) ;;will return 1
(+ (f 1) (f 0)) ;;will return 0