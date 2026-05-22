
Pseudo Code
```
for i : 1 to length(A)-1:
    j=i
    while j<0 and A[j-1]>A[j]:
	    swap A[j-1] and A[j]
	j=j-1
```
Time Complexity 
best O(N)
Worst O(N^2)
Average O(N^2)
