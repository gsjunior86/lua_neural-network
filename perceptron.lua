require "matrix_utils"
require "array_utils"
local matrix = require "lib.matrix"
require "lib.complex"


local function sigmoid(x)
  sig = 1/(1 +  math.exp(-x))
  return sig
end

local function sigmoid_derivative(x)
  return x * (1-x)
end

local function initialize_weights(w)
  a = {}
  for i=1, w do
    a[i] = math.random() + math.random(-1, 1)
  end
  return matrix(a)
end

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

math.randomseed(1)

 synaptic_weights = initialize_weights(3)

--synaptic_weights = matrix{
--  -0.16595599,
--  0.44064899,
--  -0.99977125}



for iter=0,20000 do
  input_layer = training_inputs

  outputs = m_func(matrix.mul(input_layer,synaptic_weights),sigmoid)

  error = matrix.sub(training_outputs,outputs)
  
  adjustments = matrix.mul(error,m_func(outputs,sigmoid_derivative))

  synaptic_weights = matrix.add(synaptic_weights,matrix.mul(matrix.transpose(input_layer),adjustments))
  
  print("Error:")
  print_matrix(error)
  
  print("Adjustments: ")
  print_matrix(adjustments)
 
  print("Synaptic Weights after training:")  
  print_matrix(synaptic_weights)
  
  print("Outputs after training:")  
  print_matrix(outputs)
  
end

