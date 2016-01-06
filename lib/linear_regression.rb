require_relative 'linear_hypothesis_function'

class LinearRegression

  attr_reader :training_set

  def initialize(training_set) #[{i: input, o: output}, ... ]
    @training_set = training_set
  end

  def m
    training_set.length.to_f
  end

  def cost(hypothesis) #expect hypothesis to be of class LinearHypothesisFunction
    num = training_set.reduce(0) do |acc, i_o|
      acc + (hypothesis.of(i_o[:i]) - i_o[:o])**2
    end

    num/(2*m)
  end

  def update_theta0(learning_rate, hypothesis)
    grad_0 = training_set.reduce(0) do |acc, i_o|
      acc + (hypothesis.of(i_o[:i]) - i_o[:o])
    end
    hypothesis.theta_0 - learning_rate*grad_0/m
  end

  def update_theta1(learning_rate, hypothesis)
    grad_1 = training_set.reduce(0) do |acc, i_o|
      acc + (hypothesis.of(i_o[:i]) - i_o[:o])*i_o[:i]
    end
    hypothesis.theta_1 - learning_rate*grad_1/m
  end

  def update(learning_rate, hypothesis)
    theta_0 = update_theta0(learning_rate, hypothesis)
    theta_1 = update_theta1(learning_rate, hypothesis)
    LinearHypothesisFunction.new(theta_0, theta_1)
  end

  def regress(learning_rate, initial_hypothesis, threshold, n)
    current_hyp = initial_hypothesis

    n.times do
      break if cost(current_hyp) < threshold
      current_hyp = update(learning_rate, current_hyp)
    end

    {"y-intercept" => current_hyp.theta_0, "slope" => current_hyp.theta_1}
  end
end

ts = [{i:0,o:0},{i:1,o:1}]
lr = LinearRegression.new(ts)

p lr.regress(0.5, LinearHypothesisFunction.new, 0.0000005, 50) #=> good up to thousands place
