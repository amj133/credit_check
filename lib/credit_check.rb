# credit_check.rb - checks if a proposed credit card number is valid using
# the Luhn Algorithm

require 'pry'

class LuhnAlgorithm

  def initialize (card_number)
    @card_number = card_number
  end

  # creates an array of our digits and reverses their order - Luhn algorithm
  def rearrange
    @card_number.chars.reverse
  end

  # creates a new array w/ every other digit doubled (hence digits_2x name)
  def odd_index_doubled (arranged)
    arranged.map.with_index do |number, index|
      if index.odd?
        number.to_i * 2
      else
        number.to_i
      end
    end
  end

  # creates a new array using the following condition - if the digit doubled
  # above is greater than 9 (e.g. 12) then it will add the tens and ones place
  # to create a new number (e.g. 3)
  def sum_digits_over_10 (odd_doubled)
    odd_doubled.map do |number|
      if number > 9
        number = number - 9
      else
        number
      end
    end
  end

  # sums all the digits in our latest array, if it is a multiple of 10 then we
  # have a valid number!
  def final_check (modified_digits)
    if modified_digits.sum % 10 == 0
      "The number is valid!"
    else
      "The number is invalid!"
    end
  end

end

# puts final_check(summed_digits_over_10(odd_index_doubled(rearrange(card_number))))  TOO MESSY!!

card_to_test = LuhnAlgorithm.new("6011797668867828")
reverse = card_to_test.rearrange
odd_doubled = card_to_test.odd_index_doubled(reverse)
summed_digits = card_to_test.sum_digits_over_10(odd_doubled)
puts final_check = card_to_test.final_check(summed_digits)
