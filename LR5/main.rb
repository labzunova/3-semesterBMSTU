require_relative 'client'

class Main
  client = Client.new
  client.input_request
  client.input_x
  x = C.arg
  y = -Math.sqrt(Math.cos(5*x/(1-6*x)))/(x*x)
  client.result_output y
end