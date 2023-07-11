#lang racket

(define (lambda1 x) (* x x ))

(define lambda2
  (lambda ()
    (display "I am a simple lambda function which only prints to screen :)")))


(define child23
  (cons null lambda2)) 

(define child22
  (cons 1923 "Güliz"))

(define child21
  (cons "Eren" child23))

(define child20
  (cons child22 "Nuri"))

(define child19
  (cons child20 child21))

(define child18
  (cons "Serhat" child19))

(define child17
  (cons "Büşra" child18))

(define list16 (list "Didem" lambda1 child17))

(define child14
  (cons "Hüseyin" "Samet"))

(define child12
  (cons "Ersin" 7))

(define child8
  (cons "Adil" "Burak"))

(define child11
  (cons child8 child12))

(define child10
  (cons child11 "Didem"))

(define child9
  (cons child10 lambda1)) 

(define list13 (list child14 null "Dilek" "Altuğ")) ;list13

(define child7
  (cons child8 list13))

(define list15 (list "Cansu" "Ege" child19 list16)) ;list15

(define child6
  (cons child7 list15))

(define child5
  (cons 1992 child6))

(define child4
  (cons child5 child9))

(define child3
  (cons 3 child5))

(define child2
  (cons child3 child3))

(define headPair1
  (cons child2 child4))

;---------------------------------------------------------------------------->

(define (myproc v1 v2 v3)
  (define visited '()) 
  
  (define (explore item)
    (cond
      ((or (null? item) (member item visited)) '())
      ((pair? item)
       (explore (cdr item))
       (explore (car item)))
      ((list? item)
       (for-each explore (reverse item)))
      ((and (or (string? item) (number? item) (procedure? item)) (v2 item))
       (begin
         (v3 item)
         (set! visited (cons item visited))))
      (else '())))
  
  (explore v1))
(define (predicate item)
  (or (string? item)
      (number? item)
      (procedure? item)))

(define (print-item item)
  (display item)
  (newline))

(define (is-prime? n)
  (define (iter div)
    (cond
      ((> div (sqrt n)) #t)
      ((= (remainder n div) 0) #f)
      (else (iter (+ div 1)))))
  (cond
    ((or (< n 2) (and (> n 2) (= (remainder n 2) 0))) #f)
    (else (iter 2))))

(define (print-prime item)
  (if (and (number? item) (real? item) (is-prime? item))
      (begin
        (display item)
        (newline))
      '()))
(define (print-string item)
  (if (and (string? item) (> (string-length item) 5))
      (begin
        (display item)
        (newline))
      '()))

(myproc headPair1 predicate print-item)
(myproc headPair1 predicate print-prime)
(myproc headPair1 predicate print-string)
(lambda1 17)
(lambda2)

