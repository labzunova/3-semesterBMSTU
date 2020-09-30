class MathFunc
  def func(x)
    y = -Math.sqrt(Math.cos(5*x/(1-6*x)))/(x*x);
    y = y.round(6)
  end
end