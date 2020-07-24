Intuitive Language
==================
*(taken from [hackerrank])*

Sometimes it is hard to read the code written in the language you are not familiar with, not unless its written in Intuitive Language. Here's the sample of a program.

    A is 15.  
    Sum is function of 2: 1, 1, 0.  
    Inc is function of 1: 1, 1.  
    I is 1.  
    F1 is 1.  

    do {10} assign I*F1 to F1 AND Inc[I] to I!  
    what is I AND F1?  

    what is Sum[1]?  

Pretty straightforward, when compared with some popular languages, isn't it? Lets break down the rules here.

Language allows:

* To declare function.
* Assign value to variable.
* Make a loop with fixed number of repetition.
* Ask about function's value.

How to declare a function?
--------------------------

Function is an expression of n parameters.

    Function1 is function of n: k1, k2, ..., kn, k0.

represents a function called `Function1`, when called with `n` parameters it will yield following value

    k1*%1 + k2*%2 + ... + kn*%n + k0

where `%i` is the ith parameter, and `k0, k1, ..., kn` are the coefficients.

Formally, a function with `n` parameters is defined as

    %Variable% is function of %N%: %Expression1%, %Expression2%, ..., %ExpressionN%, %Expression0%.

where `k0 = Expression0`, `k1 = Expression1`, ..., `kn = Expressionn`.

Simpler, optional, way to declare a function with no parameter is:

    %Variable% is %Expression%.

Note:
1. Declaration ends with a dot, (`.`) .
2. You can declare a function, with one or more parameters, only one time.
3. It's guaranteed that function declaration will not contain any function calls, i.e., there will be no coefficient ki which contains a function call.
4. A function with 0 parameter will be considered as a variable. It can be reassigned multiple times.

Examples

    A is function of 2: 3, -15, 1.

That means `A = 3*%1 - 15*%2 + 1`.

    B is function of 0: 14.

That means `B = 14`.

    C is 7.

That means `C = 7`.

How to assign value to variable?
--------------------------------

    assign %Expression1% to %Variable1% [ AND %Expression2% to %Variable2% ... ]!

This means that the value of `Variablei` will be `Expressioni`.

Note:
1. Multiple assignments go left-to-right.
2. Assignment ends with an exclamation sign, (`!`).
3. You can assign values to a variable multiple times.

Examples

    assign (3+4*2) to V!

`V` will be equal to `11`.

    assign 3 to P AND (4+5) to Q AND (Q-15) to R!

This expression assigns 3 to `P`, 9 to `Q` and -6 to `R`.

How to make a loop?
-------------------

    do {Expression} %Assign values(s) to variable(s)%!

Assignment inside the loop will be repeated number of times indicated in `{}`. This number is guaranteed to be positive integer.

Examples

    I is 1.
    F is 1.
    do {3} assign I*F to F AND I+1 to I!

Initially it will be `I = F = 1`. It will loop 3 times. At first loop, `F = 1`, `I = 2`, after second loop `F = 2`, `I = 3` and after third/final loop it will be `F = 6`, `I = 4`.

How to ask about variables and function's value?
------------------------------------------------

    what is %Function1 call% [AND %Variable1% [ AND %Function2 call% ... ] ]?

A function's value or variable's value can be asked anywhere, once it has been initialised.

Function call:

    %Name%[Expression1][Expression2]...[ExpressionM].

`Expressioni` will be the ith parameter, `%i`, in function declaration. If all `n` parameters are provided: the result of function call will be a value. Otherwise: it will result into another function which takes remaining parameters.

Note:
1. You have print coefficients, comma and space separated, as output in a line. 
2. Question ends with '?'.

Examples

    A is 15/4.  
    Sum is function of 2: 3, 2, 4. 

    what is Sum[10] AND A?
    what is Sum[20][10]?    

will print the following output

    2, 34
    15/4
    84

Let's represent `Sum` function as

    λ(a, b) -> 3a + 2b + 4

So, `Sum[10] (a = 10)` will result into another function

    λ(b) -> 3*10 + 2b + 4 =>
    λ(b) -> 2b + 34

New coefficients will be 2 and 34. Calling `Sum[20][10]` will result into `3*20 + 2*10 + 4 = 84`.

Notes:

1. All numbers are rational integers, represented like `a / b` (or just `a` if `b=1`). Here `b` is a positive integer, `a` is any integer. Greatest common divisor for `a` and `b` should be 1.
2. ```- Number: n, where n is any integer number
   - PNumber: n, where n > 0
   - Value: Number | Number / PNumber | FValue
   - FValue: Calling function of n with all n parameters
   - OPa: + | -
   - OPb: * | /
   - Expression: Term [OPa Term1 ...]
   - Term: Fact [OPb Fact1 ...]
   - Fact: Value | (Expression)
   - Letter: 'A'..'Z' | 'a'..'z'
   - OPb > OPa```
3. Variable consists of 1 or more letters followed by 0 or more digits; Key words (`is`, `of`, `assign`, `what`, `function`, `do`, `and`, `to`) are not allowed as variable names.
4. Language is case insensitive. Variable name, function name and keywords are all case insensitive.
5. The coefficients of functions are guaranteed to be expressions without variables.
6. It is guaranteed that function call will occur only after it's definition.
7. Whitespace between tokens should be ignored.
8. All operators follows left associativity.

Constraints:
1. It's guaranteed that function declaration will not contain function calls.
3. All given numbers will be between -100 and 100.
4. Resulting numerator / denominator will not exceed 109 by absolute value.
5. Functions will have no more than 5 parameters.
6. Function name will contain no more than 20 characters.
7. ach loop will have no more than 1000 iterations.

Problem
-------

    A is 2/6. 
    b is function of 2: -3, 7/4, 38/1.  
    I is 1.  

    do {b[-2][4]-A*30} assign I+1 to I and I-1 to I and I+1 to I!  

    what is I?
    
This one is extremely simple but I promise to check every single solution by hand.

[hackerrank]:https://www.hackerrank.com/challenges/intuitive-language/problem