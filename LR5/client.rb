class Client
  arg
  def input_request
    puts 'enter x'
  end

  def input_x
    arg = gets
    if arg.is_a?(Fixnum)
      arg = gets.to_i
    else
      puts 'enter a number'
    end
  end

  def result_output(res)
    puts 'Result of -sqrt(cos(5*x/(1-6*x)))/(x*x): ', res
  end
end