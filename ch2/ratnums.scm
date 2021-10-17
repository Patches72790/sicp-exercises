(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (numer n) (car n))

(define (denom n) (cdr n))

(define (make-rat n d)
    (let ((g (gcd n d)))
      (cond ((and (< n 0) (< d 0)) ; n < 0 and d < 0
                (cons (/ n g) (/ d g)))
            ((or (< n 0) (< d 0))
                (cons (/ (- n) g) (/ d g)))
            (else (cons (/ n g) (/ d g))))))

(define (print-rat r)
    (newline)
    (display (numer r))
    (display "/")
    (display (denom r)))



