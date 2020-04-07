#Ruby's perls

Ruby wants to create a perl collar, for which she has white and black perls. Because of the size of the collar, it needs to have exactly 21 perls. Ruby has enough white and black perls to make any possible combination for a 21-perl collar.

However, she has a sophisticated aesthetic requirement: for any 5 consecutive perls, at most 2 can be black.

Being the computer scientist she is, naturally Ruby wants to compute how many different possibilities she has to create her collar.

##Question:

How many different 21-perl collars with that requirement can she create?

Note that, since the collar only contains perls and nothing else, rotating a collar still counts as the same collar (in fact when it is around her neck she will not be able to avoid turning it around constantly, when she is concentrated on her coding). However, mirroring the collar counts as a different collar. See example below.

##Example (for 9 perl-collars):

If, instead of 21 perls, we wanted to make collars of 9 perls, then (denoting white by 0 an black by 1):

The collar made by the sequence 0 0 0 1 0 1 0 0 1  is the same as the one given by the sequence 0 1 0 0 0 1 0 1 0 (because it is a cyclic shift two positions to the right). However, it is not the same as the mirrored version 1 0 0 1 0 1 0 0 0, since you can never obtain this from the first one by cyclically shifting.

The collar made by the sequence 0 0 0 1 0 1 0 0 1 is valid, the collar made by 1 0 0 1 0 1 0 0 1 is NOT, because the last 4 perls in the list together with the first one make 3 black perls. That is too many!

In the case of 9-perl collars, the result would be 10 different collars, given by:


0 0 0 0 0 0 0 0 0<br>
0 0 0 0 0 0 0 0 1<br>
0 0 0 0 0 0 0 1 1<br>
0 0 0 0 0 0 1 0 1<br>
0 0 0 0 0 1 0 0 1<br>
0 0 0 0 1 0 0 0 1<br>
0 0 0 1 0 0 0 1 1<br>
0 0 0 1 0 0 1 0 1<br>
0 0 0 1 0 1 0 0 1<br>
0 0 1 0 0 1 0 0 1


# Credits
Thanks Ignacio Cascudo for providing this problem! 
