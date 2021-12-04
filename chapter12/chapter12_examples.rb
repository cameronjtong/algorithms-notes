#find largest nunber in an array
#code contains a duplication


def max(array)
  return array[0] if array.length == 1
  if array[0] > max(array[1..])  #means this element must be the greatest in the array
    return array[0]
  else
    return max(array[1..])
  end
end

#remove duplication by introducing a temp

def max(array)
  max_remainder = max(array[1..])
  #store the call in a temp to avoid multiple calls
  if array[0] > max_remainder
    return array[0]
  else
    return max_remainder
  end
end
#initially we make 2 calls per element, each element doubles the calls O(2**N)
#it then becomes proportional to the number of elements O(N)

#fibonacci sequence
#calls itself twice in the initial solution

def fibb_for(n)
  return n if n == 0 || n == 1

  return fibb_for(n-2) + fibb_for(n-1) #two calls, a temp doesnt work here because its not an identical call
end

#we want to introduce memoization using a hash table, see ruby memoization patterns article

def fibb_for(n,memo={})
  return n if n==0 || n==1
  if !memo[n]
    memo[n] = fibb_for(n-2, memo) + fibb_for(n-1, memo)
  end
  return memo[n]
end

p fibb_for(10)

#bottoms up approach

def fibb(n)
  return n if n== 0

  a = 0
  b = 1

(n -1).times do
  temp = a
  a = b
  b = temp + a
end
  return b
end

p fibb(10)

#exercises

def golomb(n)
  return 1 if n == 1
  return 1 + golomb(n - golomb(golomb(n-1)))
end

p golomb(3)
#refactored to

def golomb(n, memo={})
  return 1 if n == 1
  if !memo[n]
    memo[n] = 1 + golomb(n - golomb(golomb(n-1, memo), memo),memo)
  end
  memo[n]
end

p golomb(3)

def unique_paths(rows, columns)
  return 1 if rows == 1 || columns == 1
  return unique_paths(rows - 1, columns) + unique_paths(rows, columns - 1)
end

#refactored to

def unique_paths(rows, columns, memo={})
   return 1 if rows == 1 || columns == 1
   if !memo[[rows,columns]]
    memo[rows,columns] = unique_paths(rows - 1, columns, memo) + unique_paths(rows, columns - 1, memo)
  end
  return memo[rows,columns]
end