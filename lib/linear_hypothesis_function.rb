class LinearHypothesisFunction
  attr_accessor :theta_0, :theta_1

  def initialize(t_0 = rand(-1.0..1.0), t_1 = rand(-1.0..1.0))
    @theta_0 = t_0
    @theta_1 = t_1
  end

  def of(x)
    theta_0 + theta_1 * x
  end
end

#sample usage

f = LinearHypothesisFunction.new(1,4)
p f.of(0)
p f.of(2)
p f.of(6)
