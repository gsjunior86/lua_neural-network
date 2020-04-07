local matrix = require "lib.matrix"
require "neural_network"

training_inputs = matrix{
  {0,0,1},
  {1,1,1},
  {1,0,1},
  {0,1,1}
}

training_outputs = matrix{
  {1},
  {1},
  {1},
  {0}
}



function main()

local nn = NeuralNetwork:new(1)

nn.train(training_inputs,training_outputs,20000)

test_input = matrix{
  {1,0,1}
}
print_matrix(nn.run(test_input))  

end


main()
