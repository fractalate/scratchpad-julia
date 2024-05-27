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

# Project Euler 9

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

module ProjectEuler10

# Project Euler 10

# This problem asks to find the sum of the primes less than a given number.
# This is accomplished by generatig all the primes less than that number and
# summing them together.

using Primes

function sum_of_primes_below(n)
  total = 0
  for prime in Primes.primes(n - 1)
    total += prime
  end
  return total
end

#println(sum_of_primes_below(10))
#println(sum_of_primes_below(11)) # Testing the "below" condition with a prime.
println(sum_of_primes_below(2_000_000))

end # ProjectEuler10

module ProjectEuler11

# Project Euler 11

# This problem asks to find the product of the four numbers which have the
# greatest sum in the given grid of numbers. Products can be formed vertically,
# horizontally, and diagonally.

# Ideas from problem number 8 might be useful, but it's not done here. The grid
# can be turned into an array instead of a matrix where zeros go at the break
# points between rows of the matrix. Then the same algorithm for problem 8 will
# find the product as long as you can formulate the four different arrays for
# the four different directions. The problem then becomes finding the greatest
# product in each row, column, diagonal 1, and diagonal 2. The largest of them
# is the largest in the grid.

numbers = [
  08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08;
  49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00;
  81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65;
  52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91;
  22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80;
  24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50;
  32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70;
  67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21;
  24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72;
  21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95;
  78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92;
  16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57;
  86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58;
  19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40;
  04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66;
  88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69;
  04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36;
  20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16;
  20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54;
  01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48
]

function find_greatest_product_of_length(length)
  rows = size(numbers, 1)
  cols = size(numbers, 2)
  length > 0 || throw(ArgumentError("The length must be positive."))
  length <= rows || length <= cols || throw(ArgumentError("The length must be less that the number or rows or columns in the grid."))
  max_product = 0

  # Horizontal Checks
  for r in 1:rows
    for c in 1:cols-length+1
      prod = 1
      for i in 0:length-1
        prod *= numbers[r, c + i]
      end
      max_product = max(prod, max_product)
    end
  end

  # Vertical Checks
  for r in 1:rows-length+1
    for c in 1:cols
      prod = 1
      for i in 0:length-1
        prod *= numbers[r + i, c]
      end
      max_product = max(prod, max_product)
    end
  end

  # Diagonal x = -y
  for r in 1:rows-length+1
    for c in 1:cols-length+1
      prod = 1
      for i in 0:length-1
        prod *= numbers[r + i, c + i]
      end
      max_product = max(prod, max_product)
    end
  end

  # Diagonal x = y
  for r in 1+length-1:rows
    for c in 1:cols-length+1
      prod = 1
      for i in 0:length-1
        prod *= numbers[r - i, c + i]
      end
      max_product = max(prod, max_product)
    end
  end

  return max_product
end

println(find_greatest_product_of_length(4))

end # ProjectEuler11

module ProjectEuler12

# Project Euler 12

# This problem asks to find the first triangle with more than 500 divisors.

using Primes

function first_highly_divisible_triangle_order_exceeding(n)
  k = 2
  while true
    triangle = k * (k + 1) ÷ 2
    factors = Primes.factor(triangle)
    count_divisors = 1
    # For each prime in the prime factorization, the exponent plus 1 is
    # the number of ways the prime can factor in to the triangle number.
    # The products like this for all prime factors is the number of divisors
    # of the triangle number.
    for (prime, exponent) in collect(factors)
      count_divisors *= (exponent + 1)
    end
    if count_divisors > n
      return triangle
    end
    k += 1
  end
end

#println(first_highly_divisible_triangle_order_exceeding(5))
println(first_highly_divisible_triangle_order_exceeding(500))

end # ProjectEuler12

module ProjectEuler13

# Project Euler 13

# This problem asks to find the leading digits of a bunch of big
# numbers added together.

numbers = [
  37107287533902102798797998220837590246510135740250
  46376937677490009712648124896970078050417018260538
  74324986199524741059474233309513058123726617309629
  91942213363574161572522430563301811072406154908250
  23067588207539346171171980310421047513778063246676
  89261670696623633820136378418383684178734361726757
  28112879812849979408065481931592621691275889832738
  44274228917432520321923589422876796487670272189318
  47451445736001306439091167216856844588711603153276
  70386486105843025439939619828917593665686757934951
  62176457141856560629502157223196586755079324193331
  64906352462741904929101432445813822663347944758178
  92575867718337217661963751590579239728245598838407
  58203565325359399008402633568948830189458628227828
  80181199384826282014278194139940567587151170094390
  35398664372827112653829987240784473053190104293586
  86515506006295864861532075273371959191420517255829
  71693888707715466499115593487603532921714970056938
  54370070576826684624621495650076471787294438377604
  53282654108756828443191190634694037855217779295145
  36123272525000296071075082563815656710885258350721
  45876576172410976447339110607218265236877223636045
  17423706905851860660448207621209813287860733969412
  81142660418086830619328460811191061556940512689692
  51934325451728388641918047049293215058642563049483
  62467221648435076201727918039944693004732956340691
  15732444386908125794514089057706229429197107928209
  55037687525678773091862540744969844508330393682126
  18336384825330154686196124348767681297534375946515
  80386287592878490201521685554828717201219257766954
  78182833757993103614740356856449095527097864797581
  16726320100436897842553539920931837441497806860984
  48403098129077791799088218795327364475675590848030
  87086987551392711854517078544161852424320693150332
  59959406895756536782107074926966537676326235447210
  69793950679652694742597709739166693763042633987085
  41052684708299085211399427365734116182760315001271
  65378607361501080857009149939512557028198746004375
  35829035317434717326932123578154982629742552737307
  94953759765105305946966067683156574377167401875275
  88902802571733229619176668713819931811048770190271
  25267680276078003013678680992525463401061632866526
  36270218540497705585629946580636237993140746255962
  24074486908231174977792365466257246923322810917141
  91430288197103288597806669760892938638285025333403
  34413065578016127815921815005561868836468420090470
  23053081172816430487623791969842487255036638784583
  11487696932154902810424020138335124462181441773470
  63783299490636259666498587618221225225512486764533
  67720186971698544312419572409913959008952310058822
  95548255300263520781532296796249481641953868218774
  76085327132285723110424803456124867697064507995236
  37774242535411291684276865538926205024910326572967
  23701913275725675285653248258265463092207058596522
  29798860272258331913126375147341994889534765745501
  18495701454879288984856827726077713721403798879715
  38298203783031473527721580348144513491373226651381
  34829543829199918180278916522431027392251122869539
  40957953066405232632538044100059654939159879593635
  29746152185502371307642255121183693803580388584903
  41698116222072977186158236678424689157993532961922
  62467957194401269043877107275048102390895523597457
  23189706772547915061505504953922979530901129967519
  86188088225875314529584099251203829009407770775672
  11306739708304724483816533873502340845647058077308
  82959174767140363198008187129011875491310547126581
  97623331044818386269515456334926366572897563400500
  42846280183517070527831839425882145521227251250327
  55121603546981200581762165212827652751691296897789
  32238195734329339946437501907836945765883352399886
  75506164965184775180738168837861091527357929701337
  62177842752192623401942399639168044983993173312731
  32924185707147349566916674687634660915035914677504
  99518671430235219628894890102423325116913619626622
  73267460800591547471830798392868535206946944540724
  76841822524674417161514036427982273348055556214818
  97142617910342598647204516893989422179826088076852
  87783646182799346313767754307809363333018982642090
  10848802521674670883215120185883543223812876952786
  71329612474782464538636993009049310363619763878039
  62184073572399794223406235393808339651327408011116
  66627891981488087797941876876144230030984490851411
  60661826293682836764744779239180335110989069790714
  85786944089552990653640447425576083659976645795096
  66024396409905389607120198219976047599490197230297
  64913982680032973156037120041377903785566085089252
  16730939319872750275468906903707539413042652315011
  94809377245048795150954100921645863754710598436791
  78639167021187492431995700641917969777599028300699
  15368713711936614952811305876380278410754449733078
  40789923115535562561142322423255033685442488917353
  44889911501440648020369068063960672322193204149535
  41503128880339536053299340368006977710650566631954
  81234880673210146739058568557934581403627822703280
  82616570773948327592232845941706525094512325230608
  22918802058777319719839450180888072429661980811197
  77158542502016545090413245809786882778948721859617
  72107838435069186155435662884062257473692284509516
  20849603980134001723930671666823555245252804609722
  53503534226472524250874054075591789781264330331690
]

function find_leading_n_digits(n)
  total = 0
  total = sum(numbers)
  return string(total)[1:n]
end

println(find_leading_n_digits(10))

end # ProjectEuler13

module ProjectEuler14

# Project Euler 14

# This problems asks to find the longest Collatz sequence for the
# starting numbers under 1 million.

collatz_length = Dict(1 => 1)

function find_collatz_sequence_length(n)
  if haskey(collatz_length, n)
    return collatz_length[n]
  end
  if n % 2 == 0
    len = find_collatz_sequence_length(n ÷ 2) + 1
  else
    len = find_collatz_sequence_length(3 * n + 1) + 1
  end
  collatz_length[n] = len
  return len
end

function find_longest_collatz_sequence_starting_below(n)
  longest = 0
  starting_number = 0
  for i in 1:n
    len = find_collatz_sequence_length(i)
    if len > longest
      longest = len
      starting_number = i
    end
  end
  return starting_number
end

println(find_longest_collatz_sequence_starting_below(1_000_000))

end # ProjectEuler14
