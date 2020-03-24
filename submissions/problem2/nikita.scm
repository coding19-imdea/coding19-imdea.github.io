;In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
;   1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
;It is possible to make £2 in the following way:
;    1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
;How many different ways can £2 be made using any number of coins?

(define (coin-value n)
  (cond ((= n 1) 1)
        ((= n 2) 2)
        ((= n 3) 5)
        ((= n 4) 10)
        ((= n 5) 20)
        ((= n 6) 50)
        ((= n 7) 100)
        ((= n 8) 200)))

(define (exchange n different-coins)
  (cond  ((or (< n 0) (= different-coins 0)) 0)
         ((= n 0) 1)
         (else (+ 
                 (exchange
                   (- n (coin-value different-coins))
                   different-coins)
                 (exchange n
                           (- different-coins 1))))))

(define answer (exchange 200 8))
