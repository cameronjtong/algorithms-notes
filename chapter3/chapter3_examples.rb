#This algo takes time proportional the the size of the input number O(N)
def is_prime(number)
  (2...number).each do |i|
    if number % i == 0
      return false
    end
    true
  end
end