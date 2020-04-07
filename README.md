# Neural Network in LUA


## A simple neural network built in lua from Scratch
To run, execute the file main.lua

Define the training inputs and the training outputs and the number of iterations for refining the training.

instantiate the NeuralNetwork class, passing the seed with:

```
local nn = NeuralNetwork:new(1)
```


and train the network with:

```
nn.train(training_inputs,training_outputs,20000)
```