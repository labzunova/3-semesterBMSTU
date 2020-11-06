# frozen_string_literal: true

require 'minitest/autorun'

require_relative 'files'

# files logic testing
class Test < Minitest::Test
  def setup; end

  def files_check
    file_to_file('test_file.txt')
    text = IO.read('G.txt')
    assert_equal(text, 'dlrow ollehdlrow ollehdlrow olleh')
  end
end
