##### Loading the packages
using DifferentialEquations

### Defining the function
# u=[theta, omega], u[1]=theta, u[2]=omega
function physicalpendulum!(du,u,p,t)
    du[1]=u[2]
    du[2]=-(3*9.81/2*1.0)*sin(u[1]) ### Considering M (external torque) to be zero
end

#### Defining the conditions
u0=[0.01,0.0]  # Initial condition
tspan=(0.0,10.0) # Time span
prob=ODEProblem(physicalpendulum!, u0, tspan) # defining the problem


### Solving the DifferentialEquations
sol=solve(prob, Tsit5())

#### Plotting
### 0-> time, 1-> theta, 2->omega
using Plots
plot(sol, idxs=(0,1), title="Solution to Physical Pendulum", 
     xaxis="time (t)",label="Theta (t)") 

plot(sol, idxs=(0,2), title="Solution to Physical Pendulum", 
     xaxis="time (t)",label="Omega (t)")
