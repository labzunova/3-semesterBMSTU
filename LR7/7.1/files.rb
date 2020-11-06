#:reek:UtilityFunction
#:reek:NestedIterators
def file_to_file(path)
  File.open(path.to_s) do |f_desc|
    File.open('G.txt'.to_s, 'w') do |g_desc|
      while (line = f_desc.gets)
        g_desc.puts(line.chomp.reverse)
      end
    end
  end
end
