#lang racket/base

(module+ test
  (require rackunit))

(module+ test
  (check-equal? (+ 2 2) 4))

(module+ main
  (define (addition num1 num2)
    (+ num1 num2))
  (define increment
    (lambda (arg)
      (+ 1 arg))))

(module+ main
  (require racket/cmdline)
  (define who (box "world"))
  (command-line
    #:program "my-program"
    #:once-each
    [("-n" "--name") name "Who to say hello to" (set-box! who name)]
    #:args ()

    ;; Prints hello world or name
    (printf "hello ~a~n" (unbox who))

    (printf "5 + 3 is ~a~n" (addition 5 3))

    (printf "5 increment is ~a~n" (increment 5))))
