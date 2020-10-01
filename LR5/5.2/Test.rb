# frozen_string_literal: true

require_relative 'decoder'

# decode logic testing
class Test < Minitest::Test

  def setup; end

  def create_string
    rnd = Random.new
    initial_string = []
    final_string = []
    20.times do |i|
      symbol_code = rnd.rand(65...122)
      initial_string[i] = symbol_code.chr
      final_string[i] = case symbol_code[i]
                        when ' '
                          ' '
                        when 'z'
                          'a'
                        else
                          (symbol_code + 1).chr
                        end
    end
    decoder = Decoder.new
    [decoder.decode(initial_string), final_string]
  end

  def test_decoding
    assert_equal(create_string[1], create_string[2])
  end

end
