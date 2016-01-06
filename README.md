# linear_regression

### An implementation of linear regression of one variable machine learning algorithm.

First enter and save your training set:  
`ts = [{i:0,o:0}, {i:1,o:1}]`  
Randomly initialize a linear function.  This will be used as the first attempt to mimic the data, and will be trained to mimic it better:  
`line = LinearHypothesisFunction.new`  
Pick a threshold value, a max number of iterations, and a step size (how far along gradient to travel in each iteration):
`threshold = 0.000005`  
`iterations = 50`  
`learning_rate = 0.5`  
Finally use the linear regression class to train the line to mimic the data so that total cost is less than threshold, or total number of iterations is exceeded.  
`lr = LinearRegression.new(ts)`  
`lr.regress(learning_rate, line, threshold, iterations) #=> {"y-intercept" = > 0.005909427993619737, "slope" => 0.9904383446522531}`  
The output of regress are the theta_0 (y - intercept) and theta_1 (slope) values of best fitting line.
