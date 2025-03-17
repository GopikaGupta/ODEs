using DifferentialEquations

### u=[x;y;z]
function lorenz!(du,u, p, t)
    du[1]=10.0*(u[2]-u[1]) # dx/dt=10*(y-x)
    du[2]=u[1]*(28.0-u[3])-u[2] # dy/dt=x(28-z)-y
    du[3]=u[1]*u[2]-(8/3)*u[3]
end

using DifferentialEquations
u0 = [1.0;0.0;0.0]
tspan = (0.0, 100.0)
prob = ODEProblem(lorenz!, u0, tspan)

sol=solve(prob, Tsit5(),reltol=1e-8, abstol=1e-8)

using Plots
plot(sol,idxs=(1,2,3)) ## idxs for 0->t,x->1,2->y,3->z 
plot(sol,idxs=(0,2)) # this is y as a function of time