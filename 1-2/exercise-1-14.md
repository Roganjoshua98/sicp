# Exercise 1.14

Not gonna draw out the whole tree, but here is a tree written out by SICP Solutions:

        a,n
       /   \
  a,n−1     a−d(n),n
 /\        /        \
…  …  a−d(n),n−1     a−2×d(n),n
     /\             /          \
    …  …  a−2×d(n),n−1          …
         /\                    / \
        …  …       a−k×d(n),n−1   a−(k+1)×d(n),n

Space complexity refers to the amount of memory used in the worst case scenario of a procedure's process. In the case of count-change, this would refer to its recursive calls. This grows as O(n). 

Time complexity refers to the amount of time it takes to execute an algorithm depending on its input. In the case of count-change, this refers to the size of a and n. This grows as O(n^2).

