# InterpNd

[![Build Status](https://travis-ci.org/jagot/InterpNd.jl.svg?branch=master)](https://travis-ci.org/jagot/InterpNd.jl)

Usage example:
```julia
using InterpNd

x = logspace(-1, 0, 30)
y = sin(4pi*x)

xi = linspace(x[1],x[end])
yi = interp1d(y)(x,xi)
```

![Usage example](/examples/example.png?raw=true "Usage example")
