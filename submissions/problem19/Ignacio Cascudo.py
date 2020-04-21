class hand:
	def __init__(self, numbers, clubs):
		self.numbers=sort(numbers)
		self.clubs=clubs
		self.profile=group(numbers)[0]
		self.kickerstwo=group(numbers)[1]
		self.kickerthree=group(numbers)[2]
		self.kickerfour=group(numbers)[3]

	def straight(self):
		L=self.numbers
		if L==[2,3,4,5,14]:
			return 1
		else:
			for i in range(1,len(L)):
				if L[i]!=(L[i-1]+1):
					return 0
			return 1
	
	def flush(self):
		L=self.clubs
		a=L[0]
		for i in range(1,len(L)):
			if L[i]!=a:
				return 0
		return 1

	def straightflush(self):
		if self.straight()==1 and self.flush()==1:
			return 1
		else:
			return 0
	
	def four(self):
		return self.profile==[1,4]	

	def fullhouse(self):
		return self.profile==[2,3]

	def three(self):
		return self.profile==[1,1,3]
	def doublepair(self):
		return self.profile==[1,2,2]
	
	def pair(self):
		return self.profile==[1,1,1,2]

	def value(self):
		return self.straightflush()*15**14+self.four()*self.kickerfour*15**13+ self.fullhouse()*(self.kickerthree*15+self.kickerstwo[0])*15**11+ self.straight()*self.numbers[4]*15**10+self.flush()*self.numbers[4]*15**9+ self.three()*self.kickerthree*15**8+self.doublepair()*(self.kickerstwo[1]*15+self.kickerstwo[0])*15**6+self.pair()*self.kickerstwo[0]*15**5+ self.numbers[4]*15**4+self.numbers[3]*15^3+self.numbers[2]*15^2+self.numbers[1]*15+self.numbers[0]


def sort(numbers):
	swap=1
	
	while swap==1:
		swap=0
		for i in range(1,len(numbers)):
			if numbers[i]<numbers[i-1]:
				temp=numbers[i]
				numbers[i]=numbers[i-1]
				numbers[i-1]=temp
				swap=1
	return numbers	

def group(numbers):
	result=[]
	kickerfour=0
	kickerthree=0
	kickerstwo=[]
	i=0
	while i<5:
		j=0
		a=numbers[i]
		while i<5 and numbers[i]==a:
			i+=1
			j+=1
		result.append(j)
		if j==4:
			kickerfour=a
		elif j==3:
			kickerthree=a
		elif j==2:
			kickerstwo.append(a)		
	ordresult=sort(result)
	ordkickertwo=sort(kickerstwo)
	while len(ordkickertwo)<2:
		ordkickertwo.append(0)
		
	return ordresult, ordkickertwo, kickerthree, kickerfour	


def compare(hand1,hand2):
	return hand1.value()>hand2.value()
	

def translate(name):
	switcher={
                'A':14,
                '2':2,
                '3':3,
                '4':4,
                '5':5,
                '6':6,
                '7':7,
		'8':8,
		'9':9,
		'T':10,
		'J':11,
		'Q':12,
		'K':13
        }
	return switcher.get(name,"")



try:
	db=open('p054_poker.txt')
	games=db.readlines()
	S=0
	for i in range(len(games)):
		game=games[i].split()
		num1=[]
		num2=[]
		clubs1=[]
		clubs2=[]
		for j in range(5):
			num1.append(translate(game[j][0]))
			num2.append(translate(game[5+j][0]))
			clubs1.append(game[j][1])
			clubs2.append(game[5+j][1])
		hand1=hand(num1,clubs1)
		hand2=hand(num2,clubs2)
		S+=compare(hand1,hand2)

finally:
	db.close()

print 'Player 1 wins', S, 'times'

