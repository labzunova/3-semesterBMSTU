require_relative 'Decoder'

class Client
  str = gets

  decoder = Decoder.new
  while str != 'null' # null checking todo
    puts 'initial string: ', str
    puts 'final string:  ', decoder.decode(str)
    str = gets
  end
end