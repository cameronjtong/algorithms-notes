# examples are all converted to ruby for my purposes

# compare these two algos
# 100 loops
def print_numbers_version_one
  number = 2

  while number <= 100
    print number if number.even?
    number += 1
  end
end

# versus
# 50 loops
def print_numbers_version_two
  number = 2
  while number <= 100
    print number
    number += 2
  end
end

# consider steps in terms of N elements
