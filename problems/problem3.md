
# The more the merrier

  

### Introduction

As you may already know, it’s virus season. You may think of one specific virus that is making your days harder. Truth is, however, that there is no reason to think there will not be more bad tiny guys hanging out in the streets soon. This could make the situation worse—or not. In this problem we are going to simulate some (fictional) interaction among viruses. In this scenario, when different viruses pop up together they can either 1) create some new unexpected virus, or 2) “collide” with each other and annihilate all the virus population around. 

### Problem

We are going to assume there are eight “base” viruses. Each base virus is a single character from {Q, W, E, R, A, S, D, F}. Once in a while a base virus can pop up in your world. When it does, it gets appended to your virus list. For example: if W pops up and then A pops up, (we'll call that "WA popping up" for short) then your virus list will be [W, A].

We will specify pairs of base viruses that combine to form non-base viruses (the other 18 capital letters). For example, Q and F might combine to form T. If the two viruses from a pair appear at the end of the virus list, then both viruses of the pair will be immediately removed, and they will be replaced by the virus they form. In the example above, if the virus list looks like [A, Q, F] or [A, F, Q] at any point, it will become [A, T].

We will specify pairs of base viruses that are opposed to each other. After a virus pops up, if it isn't immediately combined to form another virus, and it is opposed to something in your virus list, then your whole virus list will be cleared (all viruses die!).

For example, suppose Q and F combine to make T. R and F are opposed to each other. Then if the following things pop up (in order, from left to right) we will have the following results:

-   QF → [T] (Q and F combine to form T)
    
-   QEF → [Q, E, F] (Q and F can't combine because they were never at the end of the virus list together)
    
-   RFE → [E] (F and R are opposed, so the list is cleared; then E pops up)
    
-   REF → [] (F and R are opposed, so the list is cleared)
    
-   RQF → [R, T] (QF combine to make T, so the list is not cleared)
    
-   RFQ → [Q] (F and R are opposed, so the list is cleared)
    

Given a list of viruses in the order they are going to pop up, what will be in the virus list when they’re done? Will you ever get back to pick up that parcel of 40000 pods of Nespresso you received at IMDEA some days back? Or will you have to learn not to worry and start loving quarantine?

### Input

The first line of the input gives the number of test cases, T. T test cases follow. Each test case consists of a single line, containing the following space-separated viruses in order:

First an integer C, followed by C strings, each containing three characters: two base viruses followed by a non-base virus. This indicates that the two base viruses combine to form the non-base virus. Next will come an integer D, followed by D strings, each containing two characters: two base viruses that are opposed to each other. Finally there will be an integer N, followed by a single string containing N characters: the series of base viruses that are going to pop up. They will pop up in the order they appear in the string (leftmost character first, and so on), one at a time.

### Output

For each test case, output one line containing "Case #x: y", where x is the case number (starting from 1) and y is a list Li in the format "[v0, v1, ...]" where vi is the ith virus of the final virus list. Then output a final line containing a number M where M := sumi(len(Li)). Please see the sample output for examples.

### Limits

``1 ≤ T ≤ 100.``

Each pair of base viruses may only appear together in one combination, though they may appear in a combination and also be opposed to each other.

No base virus may be opposed to itself.

#### Small dataset (find it [here](https://coding19-imdea.github.io/problems/problem3-small.in))
```
0 ≤ C ≤ 1.
0 ≤ D ≤ 1.
1 ≤ N ≤ 10.
```
For you to check if you are on the right track: for the small dataset you should get M=568

  
  

#### Large dataset (find it [here](https://coding19-imdea.github.io/problems/problem3-large.in))

 ```
0 ≤ C ≤ 36.
0 ≤ D ≤ 28.
1 ≤ N ≤ 100.
```
### Sample 


**Input**
```
5
0 0 2 EA
1 QRI 0 4 RRQR
1 QFT 1 QF 7 FAQFDFQ
1 EEZ 1 QE 7 QEEEERA
0 1 QW 2 QW
```
  
**Output**

```
Case #1: [E, A]
Case #2: [R, I, R]
Case #3: [F, D, T]
Case #4: [Z, E, R, A]
Case #5: []
12
```
