require_relative 'client'

class Main
  client = Client.new
  x = client.input_request
  y = -Math.sqrt(Math.cos(5*x/(1-6*x)))/(x*x)
  client.result_output y
end
