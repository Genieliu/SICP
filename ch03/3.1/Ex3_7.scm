(define (inlist? pw pw-list)
  (define (iter pw-rest result)
    (cond ((= result 1) '#t)
	  ((null? pw-rest) '#f)
	  (else
	   (if (eq? pw (car pw-rest))
	       '#t
	       (iter (cdr pw-rest) result)))))
  (iter pw-list 0))

(define (make-account base password)
  (define (withdraw amount)
    (if (>= base amount)
	(begin (set! base (- base amount))
	       base)
	"Insufficient funds"))
  (define (deposit amount)
    (set! base (+ base amount))
    base)
  (define (dispatch p m)
    (if (inlist? p password)
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      ((eq? m 'access) '#t)
	      ((eq? m 'addpw) (lambda(newpw)
				(set! password (cons newpw password))))
	      (else (error "Unknown request -- MAKE-ACCOUNT"
			   m)))
	(lambda (x)
	  "Insufficient Pw-List")))
  (begin (set! password (cons password '()))
	 dispatch))


(define (make-join account pw new-pw)
  (if (account pw 'access)
      (begin ((account pw 'addpw) new-pw)
	     account)
      (error "Insufficient password!")))
