# frozen_string_literal: true

require_relative 'integral_enum'

# client class
class Main
  puts 'integral with 10^-3 precision', count(0.001.to_f)
  puts 'integral with 10^-4 precision', count(0.0001.to_f)
end
