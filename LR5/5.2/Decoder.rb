
class Decoder
  def decode(str)
    decoded_string = []
    arr = str.split(//)
    (0..arr.length-2).each do |i|
      if arr[i] == ' '
        decoded_string[i] = ' '
        else if arr[i] == 'я'
               decoded_string[i] = 'а'
               else decoded_string[i] = (arr[i].ord + 1).chr
             end
      end
    end
    decoded_string.join
  end

end