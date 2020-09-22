# Write your code for the 'Luhn' exercise in this file. Make the tests in
# `luhn_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/luhn` directory.

class CardChecker
  def self.valid?(str)
    return false if /[^\d\s]/.match(str)

    arr = str.split(' ').join('').split('')
    return false if arr.length < 2

    sum = 0
    startIndex = 1
    startIndex = 0 if arr.length.even?
    endIndex = arr.length - 2
    (startIndex..endIndex).step(2).each do |index|
      d = arr[index].to_i
      sum += if d * 2 > 9
               d * 2 - 9
             else
               d * 2
             end
    end
    startIndex = 0
    startIndex = 1 if arr.length.even?
    endIndex = arr.length - 1
    (startIndex..endIndex).step(2).each do |index|
      d = arr[index].to_i
      sum += d
    end
    sum % 10 == 0
  end
end
