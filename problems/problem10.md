Nairobi, Tokio, and The Professor should escape from the police. 
Each one is carrying one box that contains diamonds, gold, and cash mixed. To facilitate their escape, they need to quickly separate the stolen items and leave for different destinations. 

The goal is to minimize the number of items that are moved. You may assume that the only problem is to minimize the number of movements between boxes. For the purposes of this problem, each box has infinite capacity and the only constraint is moving the items so that each box contains only items of the same kind. The total number of items will never exceed 2^31. 

Input 
----
The input consists of 9 integers. The first three integers represent the number of diamonds, gold, and cash (respectively) in box number 1, the second three represent the number of diamonds, gold and cash (respectively) in box number 2, and the last three integers represent the number of diamonds, gold, and cash (respectively) in box number 3. For example, the input 

```
10 15 20 30 12 8 15 8 31 
```

indicates that there are 20 units of cash in box 1, 12 units of gold in bin 2, and 15 units of diamonds in box 3. Integers will be separated by one or more spaces. 

Output 
------
The output should be the minimum number of item movements so that each box contains items only of a single kind. 

Examples
----------
For the input 

```
1 2 3 4 5 6 7 8 9 
```

your program should return `30`. 

For the input 

```
5 10 5 20 10 5 10 20 10 
```

your program should return `50`. 


Problem Input
-------------

What does your program return for the below input?


```
85263245 25965748 69854785 15874569 36985745 12365478 36985526 32147859 96587458
```


Credits
-------
This problem is adjusted from [onlinejudge](https://onlinejudge.org/). 
