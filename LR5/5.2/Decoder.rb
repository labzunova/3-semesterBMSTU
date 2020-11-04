# frozen_string_literal: true

# string decoding class
# :reek:UtilityFunction
# :reek:TooManyStatements
class Decoder
  def decode(str)
    decoded_string = []
    arr = str.split(//)
    (0..arr.length - 2).each do |iteration|
      current_word = arr[iteration]
      decoded_string[iteration] = case current_word
                                  when ' '
                                    ' '
                                  when 'я'
                                    'a'
                                  else
                                    (current_word.ord + 1).chr
                                  end
    end
    decoded_string.join + ' '
  end
end
