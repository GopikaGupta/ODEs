####-----Loading the packages
using DifferentialEquations


####-----defining the problem
f(u, p, t) = 1.01 * u
u0 = 1/2
tspan = (0.0, 1.0)
prob = ODEProblem(f, u0, tspan)   # (function, initial conditions, time span)
sol = solve(prob)


### Solving the problem
## saveat will save at every 0.1 timespan, We need an algorithm to solve ODE problem i.e., Thesauras 5 algorithm
sol=solve(prob, Tsit5(),reltol=1e-8, abstol=1e-8)  # (problem, algorithm, relative and absolute tol errors)

#### Analyzing the problem
sol[5]


##### Visualizing the plots
using Plots
plot(sol, linewidth=5, title="Solution to linear ODEs with thick line", 
     xaxis="time(t)", yaxis="u(t)",label="My thick line!")
### since we are plotting second plot on top pf first plot, we are using ! symbol: 
plot!(sol.t, t->0.5 *exp(1.01t),linewidth=3,ls=:dash, label="True Solution!" ) ## true solution of f(u, p, t) = 1.01 * u
