# frozen_string_literal: true

require_relative 'decoder'

# client class
class Client
  sequence = gets('0').chomp('0')
  decoder = Decoder.new
  puts '---'
  puts 'initial sequence: ', sequence
  puts '---'
  puts 'final sequence:  '
  strings = sequence.split(10.chr)
  (0..strings.length - 1).each do |i|
    puts decoder.decode(strings[i])
  end
end