---
layout: post
title: "GSoC2015: Wrap up and Outlook"
authors: Amit
date: "2015-08-26 19:27"
---

Hello everyone,

During the past few weeks we have worked on improving the Documentation, and have focused on the parallelization of Quantum Monte Carlo Wave Function Method
(please refer to the previous [blog](http://juliaquantum.github.io/news/2015/08/GSoC2015-Quantum-MCWF-method-and-QuDynamics/) for the implementation of Quantum MCWF in QuDynamics). The documentation has completely been revamped, there is a structure
to each of the method/type implemented. The general outline is to include the following for every method/type :

```julia
@doc """
Name of the method/type

Requirement for the method/type (or) the action of method/type

### Fields for type / ### Arguments for method

* Field/Argument name :: Type

Description of Field/Argument
""" ->
```

The idea has been taken from the [Sims.jl](https://github.com/tshort/Sims.jl) and we hope to style the documentation of the
future types/methods in this fashion. Moving on, we have a revamped [README.md](https://github.com/JuliaQuantum/QuDynamics.jl) which
has more content on the installation of the package, usage of the package and references to
the design of the package.

We would like to present the overview of the package :

The following Dynamical Equations can be solved using this package :

1. Schrodinger Equation
2. Liouville von Neumann Equation
3. Lindblad Master Equation

Using the following solvers :

1. Euler Method, Crank-Nicholson Method, Krylov subspace Method
2. ode45, ode78, ode23s which have been integrated from [ODE.jl](https://github.com/JuliaLang/ODE.jl)
3. Two versions of `expmv` implementations from :
   a. [ExpmV.jl](https://github.com/marcusps/ExpmV.jl)
   b. [Expokit.jl](https://github.com/acroy/Expokit.jl)
4. Quantum Monte-Carlo Wave Function Method has been integrated with reference from the article : Monte Carlo Simulation of the Atomic Master Equation for Spontaneous Emission, Phys. Rev. A 45, 4879 (1992) by R. Dum, P. Zoller, and H. Ritsch.

Please refer to the [usage](https://github.com/amitjamadagni/QuDynamics.jl/blob/master/README.md#usage) of the README for further examples.

We have worked on the parallelization of MCWF method and here is an outline on how parallelization would look :


```julia

# This can go into a file like mcwf_parallel.jl

using QuBase
using QuDynamics

Base.complex{B<:QuBase.OrthonormalBasis}(qarr::QuBase.AbstractQuArray{B}) = QuBase.similar_type(qarr)(complex(coeffs(qarr)), bases(qarr))

ad = raiseop(2)
h = ad*ad'
cs = coherentstatevec(2, 1.)
rho = complex(cs*cs')
rhos = Array(typeof(rho), length(0.:0.25:2*pi)-1)
for i=1:length(0.:0.25:2*pi)-1
    rhos[i] = complex(zeros(rho))
end
qumcwfen = QuMCWFEnsemble(complex(cs), 2000)
```

```julia
julia> addprocs(2)

julia> @everywhere require("path-of-mcwf_parallel.jl")

julia> @parallel (+) for j = 1:length(qumcwfen)
           # new initial state vector
           psi0 = QuDynamics.draw(qumcwfen)
           i = 1
           for (t,psi) in QuPropagator(h, [sqrt(0.1)*ad'], psi0, 0.:0.25:2*pi, QuMCWF())
               rhos[i] = (psi*psi')/length(qumcwfen)/norm(psi)^2
               i = i + 1
           end
           rhos[end]
       end

# which results in
2x2 QuMatrix in FiniteBasis{Orthonormal}:
...coefficients: Array{Complex{Float64},2}
Complex{Float64}[0.6291475690675847 + 0.0im 0.32529444788954287 - 0.010798960639167337im
                 0.32529444788954287 + 0.010798960639167337im 0.3708524309324195 + 0.0im]
```

The future targets include refining the parallel implementation and also support for time dependent hamiltonians.

Last but not the least, on a personal note I would like to thank Alexander Croy for all the support, encouragement, and wonderful guidance all
along the length of GSoC. Also I would like to thank my parents for all the support throughout. A big thanks to
the JuliaQuantum team Alexander, Qi, Jarrett, Garrison for all the inputs on the proposal and also for giving me this wonderful opportunity to
be a part of Google Summer of Code 2015.
