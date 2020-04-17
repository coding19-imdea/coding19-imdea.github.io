
# CoLisp19 - Pt I

There is no CoLisp19 standard.
The goal of this (and maybe some of the following tasks) would be to have fun with Lisp, programming languages, other real-world applications (e.g. visualizing things on screen) and maybe create our own weird dialect of Lisp.

## Task
The task for this week is fairly simple. It consists of two parts.
- **Create an interpreter for a subset of Lisp of your choice**. At the very least you should be able to correctly interpret the first program in the example below. (Which Lisp? The one described in first chapters of [this book](https://leanpub.com/progalgs/read))
- [optional, but recommended] **Visualize the Abstract Syntax Tree of Lisp programs** (in pdf, html or whatever). You do not need to write your own graphical library, but do not use a library that already plots ASTs (it's fine to use a library that plots graphs and such).

We will look at the program by hand; no automatic solution check. Write a small documentation on how to run and use them. The shorter and more elegant your code the better. 

Try and do the plotting part, but try and get an elegant interpreter first. Choose how large the subset of lisp you want to handle. Either way, **focus on having fun yourself** (if you want to change the "visualizer of the AST" into a program that makes a Morgan Freeman-sounding robot voice that spells out loud the AST, please do it, by all means).



## Sample programs

Try and interpret this program.

```
(defun factorial (N)
  "Compute the factorial of N."
  (if (= N 1)
      1
    (* N (factorial (- N 1)))))

(factorial 5)
```

Optionally, try and make your interpreter be able to run this other program:
```
(defun map-vec (fn vec)
  "Map function FN over each element of VEC
   and return the new vector with the results."
  (let ((rez (make-array (length vec))))
    (dotimes (i (length vec))
      (:= (aref rez i) (call fn (aref vec i))))
    rez))

(map-vec '1+ #(1 2 3))
```