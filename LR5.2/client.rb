class Client
  @arg

  def input_request
    puts 'enter x'
    arg = gets.chomp
    if arg.to_i.is_a?(Integer)
      arg = arg.to_i
    else
      puts 'enter a number'
      arg = input_request
    end
    arg
  end

  def result_output(res)
    puts 'Result of -sqrt(cos(5*x/(1-6*x)))/(x*x): ', res
  end
end