# frozen_string_literal: true

require_relative 'files'
# client class
class Client
  path = 'F.txt'.strip
  if (File.exist? path) == false
    puts 'file doesnt exist'
  else
    file_to_file(path)
    puts 'done'
  end
end