# frozen_string_literal: true

require 'minitest/autorun'

require_relative 'files'

# files logic testing
class Test < Minitest::Test
  def setup; end

  ALPHABET = ('a'..'z').to_a
  def test_first
      @arr_result = []
      File.open('F.txt', 'w') do |file|
        rand(5..10).times do |_i|
          word = ALPHABET.sample(10).join
          file.puts(word)
          @arr_result << word.reverse
        end
      end
  end
end