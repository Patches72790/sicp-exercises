; make-segment
(define (make-segment p1 p2) (cons p1 p2))

; start-segment
(define (start-segment p) (car p))

; end-segment
(define (end-segment p) (cdr p))

; make-point
(define (make-point x y) (cons x y))

; x-point
(define (x-point n) (car n))
; y-point
(define (y-point n) (cdr n))

; midpoint-segment
(define (midpoint-segment s) 
    (let ((p1 (start-segment s))
          (p2 (end-segment s)))
    (if (or (and (= (x-point p1) 0) (= (x-point p2) 0))
            (and (= (y-point p1) 0) (= (y-point p2) 0)))
        (error "Cannot take midpoint of 2 points equal to zero!"))
    (make-point (/ (+ (x-point p1) (x-point p2)) 2)
                (/ (+ (y-point p1) (y-point p2)) 2))))

; takes two points and constructs
; pair from the diff of x and y of two points
(define (point-delta p1 p2)
    (cons (abs (- (x-point p1) (x-point p2)))
          (abs (- (y-point p1) (y-point p2)))))

; create-rectangle 2 segments
; width and height
(define (make-rectangle w h)
    (cons w h))

; get-width
; get-height

; create-rectangle 4 line segments
; list-representation
;(define (make-rectangle p1 p2 p3 p4)
;    (cons p1 (cons p2 (cons p3 p4))))

; perimeter
(define (perimeter r) 0)
; area
(define (area r) 0)


;print-point
(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))


; tests
(define p1 (make-point 2 3))
(define p2 (make-point 0 0))
(define p3 (make-point 2 0))
(define p4 (make-point 0 3))
(define s1 (make-segment p4 p1))
(define s2 (make-segment p1 p3))
(print-point p1)
(print-point p2)
(print-point (midpoint-segment s1))
(print-point (point-delta p1 p2))

(define r1 (make-rectangle s1 s2))
