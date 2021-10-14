; exercises 1.35 and 1.36

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (display next)
            (newline)
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (average a b)
    (/ (+ a b) 2))

(define (sqrt x)
    (fixed-point (lambda (y) (average y (/ x y)))
                 1.0))

(define (phi)
    (fixed-point (lambda (x) (+ 1 (/ 1 x)))
                   1.0))

(define (exp) 
    (fixed-point (lambda (x) (/ (log 1000) (log x)))
                 1.5))

(define (exp-damped)
    (fixed-point (lambda (x) (average (/ (log 1000) (log x)) x))
                 1.5))

; exercise 1.37
(define (cont-frac-iter n d k)
    (define (do-cont-frac count result)
        (if (= count k)
            result
            (do-cont-frac (+ count 1) (/ (n k) (+ (d k) result)))))
    (do-cont-frac 0 0))

(define (cont-frac-recurse n d k)
    (if (= k 0)
        0
        (/ (n k) (+ (d k) (do-cont-frac n d (- k 1))))))

(define (phi2 k)
    (+ 1 (cont-frac-iter (lambda (i) 1.0)
                    (lambda (i) 1.0)
                    k )))

(define (e k)
    (+ 2 (cont-frac-iter
                        (lambda (i) 1.0)
                        (lambda (i) (* 2 i))
                        k )))

(define (tan-cf x k)
    (cont-frac-iter
                    (lambda (i) (exp x i))
                    (lambda (i) (+ i 2))
                    k ))
    
