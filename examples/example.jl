using PyCall
pygui(:qt)
using PyPlot
matplotlib[:rcdefaults]()

using InterpNd

x = logspace(-1, 0, 30)
y = sin(4pi*x)

xi = linspace(x[1],x[end])
yi = interp1d(y)(x,xi)

figure(1)
clf()
plot(xi,yi)
plot(x,y,".")
margins(0,0.1)

savefig("example.png", transparent=true)
