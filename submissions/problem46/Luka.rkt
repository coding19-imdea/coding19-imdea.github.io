#lang racket/base

(define (msb n)
  (if (zero? n)
      0
      (+ 1 (msb (arithmetic-shift n -1)))))

(define (all-ones n)
  (if (zero? n)
      0
      (+ 1 (arithmetic-shift (all-ones (- n 1)) 1))))

(define (max-xor L R)
  (let ([LR (bitwise-xor L R)])
    (all-ones (msb LR))))

(let ([L (read)]
      [R (read)])
  (fprintf (current-output-port) "\n~a\n" (max-xor L R)))