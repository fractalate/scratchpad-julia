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

module ProjectEuler8

# Project Euler 8

# This problem asks to find the string of 13 numbers from the sequence of
# digits with the largest product.

number  = (
   "73167176531330624919225119674426574742355349194934"
 * "96983520312774506326239578318016984801869478851843"
 * "85861560789112949495459501737958331952853208805511"
 * "12540698747158523863050715693290963295227443043557"
 * "66896648950445244523161731856403098711121722383113"
 * "62229893423380308135336276614282806444486645238749"
 * "30358907296290491560440772390713810515859307960866"
 * "70172427121883998797908792274921901699720888093776"
 * "65727333001053367881220235421809751254540594752243"
 * "52584907711670556013604839586446706324415722155397"
 * "53697817977846174064955149290862569321978468622482"
 * "83972241375657056057490261407972968652414535100474"
 * "82166370484403199890008895243450658541227588666881"
 * "16427171479924442928230863465674813919123162824586"
 * "17866458359124566529476545682848912883142607690042"
 * "24219022671055626321111109370544217506941658960408"
 * "07198403850962455444362981230987879927244284909188"
 * "84580156166097919133875499200524063689912560717606"
 * "05886116467109405077541002256983155200055935729725"
 * "71636269561882670428252483600823257530420752963450"
)

function top_product(number::String, window_len::Int)
  max_prod = 0
  for n in 1 : length(number) - window_len + 1
    prod = 1
    for d in number[n:n+window_len-1]
      prod *= Int(d) - Int('0')
    end
    if prod > max_prod
      max_prod = prod
    end
  end
  return max_prod
end

println(top_product(number, 13))

end # ProjectEuler8

module ProjectEuler8Again

# Project Euler 8

# This problem asks to find the string of 13 numbers from the sequence of
# digits with the largest product.

number  = (
   "73167176531330624919225119674426574742355349194934"
 * "96983520312774506326239578318016984801869478851843"
 * "85861560789112949495459501737958331952853208805511"
 * "12540698747158523863050715693290963295227443043557"
 * "66896648950445244523161731856403098711121722383113"
 * "62229893423380308135336276614282806444486645238749"
 * "30358907296290491560440772390713810515859307960866"
 * "70172427121883998797908792274921901699720888093776"
 * "65727333001053367881220235421809751254540594752243"
 * "52584907711670556013604839586446706324415722155397"
 * "53697817977846174064955149290862569321978468622482"
 * "83972241375657056057490261407972968652414535100474"
 * "82166370484403199890008895243450658541227588666881"
 * "16427171479924442928230863465674813919123162824586"
 * "17866458359124566529476545682848912883142607690042"
 * "24219022671055626321111109370544217506941658960408"
 * "07198403850962455444362981230987879927244284909188"
 * "84580156166097919133875499200524063689912560717606"
 * "05886116467109405077541002256983155200055935729725"
 * "71636269561882670428252483600823257530420752963450"
)

function get_digit(number::String, index::Int)
  return Int(number[index]) - Int('0')
end

function top_product(number::String, window_len::Int)
  max_prod = 0
  n = 1

  curr_len = 0
  curr_prod = 1

  while n < length(number) + 1
    digit = get_digit(number, n)

    # Reset the product when you hit a zero.
    if digit == 0
      curr_prod = 1
      curr_len = 0
    # If you've hit enough non-zero digits, then the product might be the max now.
    elseif curr_len >= window_len
      # Get rid of the influence of the first digit in the window.
      curr_prod ÷= get_digit(number, n - curr_len)
      curr_prod *= digit
      if curr_prod > max_prod
        max_prod = curr_prod
      end
    # Otherwise we're calculating the product of the digits in the window.
    else
      curr_prod *= digit
      curr_len += 1
    end
    n += 1
  end

  return max_prod
end

#println(top_product("02022022202222022222", 4))
println(top_product(number, 13))

end # ProjectEuler8Again

module ProjectEuler9

# Project Euler

# This problem asks to find the one Pythagorean triplet where a + b + c = 1000
# and then find the product abc.

function find_triple(target_sum)
  for a in 1:target_sum - 1
    for b in a:target_sum
      c = target_sum - a - b
      if a^2 + b^2 == c^2
        return (a, b, c)
      end
    end
  end
  return nothing
end

const IntTripleOrNothing = Union{Tuple{Int, Int, Int}, Nothing}
function triple_prod(triple::IntTripleOrNothing)
  if triple === nothing
    return nothing
  end
  return  triple[1] * triple[2] * triple[3]
end

triple = find_triple(1000)
prod = triple_prod(triple)
println(triple, ' ', prod)

end # ProjectEuler9
