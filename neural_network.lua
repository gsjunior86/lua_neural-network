require 'matrix_utils'
local matrix = require "lib.matrix"


NeuralNetwork = {seed = 1}

function NeuralNetwork:new(seed)
  local instance = {}
  setmetatable(instance, self)
  self.__index = self
  self.seed = seed
  return instance
end

local synaptic_weights = {}


local function init(size)
  synaptic_weights = initialize_weights(size)
end

local function sigmoid(x)
  sig = 1/(1 +  math.exp(-x))
  return sig
end

local function sigmoid_derivative(x)
  return x * (1-x)
end


function NeuralNetwork.run(inputs)
  output = m_func(matrix.mul(inputs,synaptic_weights),sigmoid)
  return output
end

local function initialize_weights(w)
  a = {}
  for i=1, w do
    a[i] = math.random() + math.random(-1, 1)
  end
  return matrix(a)
end

function NeuralNetwork.train(training_inputs, training_outputs, iterations)

  ti = matrix.rows(training_inputs)
  to = matrix.rows(training_outputs)

  assert(ti == to, "Training inputs and Training outputs should have the same number of rows")

  synaptic_weights = initialize_weights(ti)
  input_layer = training_inputs

  print("Training Neural Network...")
  for iter = 1,iterations do
    output = NeuralNetwork.run(input_layer)
    error = matrix.sub(training_outputs,output)
    adjustments = matrix.mul(error,m_func(output,sigmoid_derivative))
    synaptic_weights = matrix.add(synaptic_weights,matrix.mul(matrix.transpose(input_layer),adjustments))
  end
  print("Training Finished!")

end




local function initialize_weights(w)
  a = {}
  for i=1, w do
    a[i] = math.random() + math.random(-1, 1)
  end
  return matrix(a)
end

