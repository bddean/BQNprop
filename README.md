# BQNprop
BQNprop is a toy backpropagation implementation I wrote to learn about
machine learning and array programming. It's extremely bare-bones:
Hyperparameters are all hardcoded, there are no bias nodes, and I haven't
even tested this on any real data.

I am still pleasantly surprised at how short the implementation ended
up being -- about 30 lines of code. TODO update this

# Future work
Real ML libraries apparently use Automatic Differentiation (AD)
nowadays. I've been looking into http://conal.net/papers/essence-of-ad/
as a potential implementation approach, which involves compiling functions
to an efficiently differentiable form. For BQN this might mean a codegen step.

# References

I used [3Blue1Brown](https://www.youtube.com/watch?v=Ilg3gGewQ5U&t=750s)
and [Michael Nielson's online
textbook](http://neuralnetworksanddeeplearning.com/chap2.html)
to learn the math. I used [this worked-out example
](https://steemit.com/ai/@ralampay/training-a-neural-network-a-numerical-example-part-1)
as a test.

And, of course, the [BQN docs](https://mlochbaum.github.io/BQN/).
