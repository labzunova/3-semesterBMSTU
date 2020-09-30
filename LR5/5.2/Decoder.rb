# frozen_string_literal: true

# string decoding class
class Decoder
  def decode(str)
    decoded_string = []
    arr = str.split(//)
    (0..arr.length - 2).each do |i|
      decoded_string[i] = case arr[i]
                          when " "
                            " "
                          when "я"
                            "a"
                          else
                            (arr[i].ord + 1).chr
                          end
      end
    decoded_string.join + " "
  end
end