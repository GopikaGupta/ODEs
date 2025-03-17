### Loading Packages
using DifferentialEquations


### Defining the function
# u=[S(t),I(t),R(t))], u[1]=S(t), u[2]=I(t), u[3]=R(t)
function SIRmodel!(du, u,p, t)
    du[1]=-((0.3*u[1]*u[2])/1000)
    du[2]=(0.3*u[1]*u[2])/1000 - 0.1*u[2]
    du[3]=0.1*u[2]
end


#### Defining the problem
i0=1.0
r0=0.0
N=1000
u0=[N-i0-r0,i0,r0]
tspan=(0.0,160.0)
prob=ODEProblem(SIRmodel!,u0,tspan)



#### SOlving the problem
sol=solve(prob,Tsit5())


### Plotting
using Plots
plot(sol, idxs=(0,1), title="Solution to SIR Model", 
    xaxis="time (t)",label="S(t)") # Susceptible
plot!(sol, idxs=(0,2),label="I(t)") # Infected
plot!(sol, idxs=(0,3),label="R(t)") # Recovered
