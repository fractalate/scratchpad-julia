println("Practice Session - May 12, 2024")

module ProjectEuler1

# Project Euler - Problem 1

# The problem asks for the sum of all numbers which are multiples of 3 or 5
# that are below 1000. This can be done with triangle numbers which give an
# expression for the sum of numbers 1 to N. This allows you to find the sum of
# multiples of 3, 5, or any other number by multiplying the triangle number
# by the desired factor.

function triangle_number(n)
  return n * (n + 1) ÷ 2
end

function find_sum_of_multiples_of_3_or_5_below(n)
  return (
      # 3 + 6 + 9 + ...
      3 * triangle_number((n - 1) ÷ 3)
      # 5 + 10 + 15 + ...
      + 5 * triangle_number((n - 1) ÷ 5)
      # Remove any repeats: 15 + 30 + 45 + ...
      - 15 * triangle_number((n - 1) ÷ 15)
  )
end

println(find_sum_of_multiples_of_3_or_5_below(1000))

end # ProjectEuler1

module ProjectEuler2

# Project Euler - Problem 2

# This problem asks for the sum of the even Fibonacci numbers not exceeding
# four million. This solution generates the sequence of numbers and totals
# the even ones.

function sum_even_fibonacci_not_exceeding(n)
  a = 1
  b = 2
  total = 0
  while b <= n
    if b % 2 == 0
      total += b
    end
    c = a + b
    a = b
    b = c
  end
  return total
end

println(sum_even_fibonacci_not_exceeding(4_000_000))

end # ProjectEuler2

module ProjectEuler3

# Project Euler - Problem 3

# This problem asks for the largest prime divisor of a number. I use the
# Primes.jl library for this. To set that up, in a Julia REPL, use the
# following commands:
#
#   using Pkg
#   Pkg.add("Primes")

using Primes

function largest_prime_factor_of(n)
  maximum = 0
  for (factor, _multiplicity) in Primes.eachfactor(n)
    if factor > maximum
      maximum = factor
    end
  end
  return maximum
end

println(largest_prime_factor_of(600851475143))

end # ProjectEuler3

module ProjectEuler4

# Project Euler 4

# This problem asks for the largest palindromic number that's the product
# of two three digit numbers.

function largest_palindrome_product(a0, a1)
  maximum = 0
  for a in a0:(a1-1)
    for b in (a+1):a1
      prod = a * b
      text = string(prod)
      reversed = reverse(text)
      if text == reversed && prod > maximum
        maximum = prod
      end
    end
  end
  return maximum
end

println(largest_palindrome_product(100, 999))

end # ProjectEuler4

module ProjectEuler5

# Project Euler 5

# This problem asks for the smalles number evenly divisible by the numbers
# 1 to 20. This could be done by finding successive LCMs.

function smallest_multiple_of_numbers_to(n)
  least = 1
  for i in 2:n
    least = lcm(least, i)
  end
  return least
end

println(smallest_multiple_of_numbers_to(20))

end # ProjectEuler5

module ProjectEuler6

# Project Euler 6

# This problem asks for the difference between two sums. The first sum is
# the sum of squares which has a formula to calculate directly:
# n*(n+1)*(2n+1)/6. The other sum is the sum of consecutive integers squared
# which also has a formula to calculate directly: (n*(n+1)/2)^2.

function sum_of_integers(n)
  return n * (n + 1) ÷ 2
end

function sum_of_integers_squared(n)
  result = sum_of_integers(n)
  return result * result
end
function sum_of_squares(n)
  return n * (n + 1) * (2 * n + 1) ÷ 6
end

function difference_between_sums(n)
  return sum_of_integers_squared(n) - sum_of_squares(n)
end

println(difference_between_sums(100))

end # ProjectEuler6

module ProjectEuler7

using Primes

# Project Euler 7

# This problem asks to identify the 10001st prime number, where 13 is
# considered the 6th prime.

function find_nth_prime(n)
  last = 2
  n -= 1
  while n > 0
    last = Primes.nextprime(last + 1)
    n -= 1
  end
  return last
end

println(find_nth_prime(10001))

end # ProjectEuler7
