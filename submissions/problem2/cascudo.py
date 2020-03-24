
def count_coins(tv,cl):
#Recursively counts number of different ways that a target value tv>=0 can be written as a linear combination with nonnegative integer coefficients of the elements in list cl.
	if len(cl)==1:
		return tv%cl[0]==0 #For this exercise, this is always 1, because cl[0]=1 (there is exactly one way of making up every quantity
				   #with 1 cent-coins), but this is not the case if there are no 1 cent-coins.
	else:
		return sum (count_coins(tv-i, cl[0:-1]) for i in range(0, tv+1, cl[-1] ))
		
print 'There are', count_coins(200, [1,2,5,10,20,50,100,200]), 'different ways of making up 2 pounds with coins, so there is no excuse not to pay!'
