---
layout: post
title: "GSoC2015: Quantum MCWF method and QuDynamics"
authors: Amit
date: "2015-08-14 12:02"
---

Hello everyone,

During the past few weeks we have worked on integrating Quantum Monte-Carlo Wave Function Method
as one of the solvers. We already had an initial version from QuDOS.jl and we had to set it up
for QuDynamics. The setup of the alogrithm is as follows :

1. For a single trajectory, we draw a state using `draw` from the iterator version of
`QuMCWFEnsemble`(We will get back to the structure of `QuMCWFEnsemble` at a later stage) and
for the first time step we draw a random number.
2. We propagate the state from the previous step, and then we check certain
`conditions` which involve the comparison of `norm(state_after_propagation)^2`, `eps`, `jtol`
which is a constant. Here `eps` is a random number and is generated only for the first step and
in certain cases again generated if one of the `conditions` from above gets satisfied. `eps` has to
be stored from the current step to the use in next time step, for this we had to convert the `QuMCF` to a
type from immutable which is different when compared to other solvers.
3. Finally, as a result of the `conditions`, we end up with the propagated state, which is used to generate the
density matrix.

Coming back to the structure of `QuMCWFEnsemble` this basically takes in a input of `initial state`,
the number of trajectories (which is defaulted to 500), and also has `decomp` as a field which stores the
eigen value decomposition of `initial state`, again we could have a vector passed, or we could have a density
matrix for the `initial state`, for the former we pass nothing for decomp parameter but for the latter we
store the decomposition. The iterator version of `QuMCWFEnsemble` generates a state using the `draw` function
which again has a random value generated for the choice of eigen vector from the decomposition.

The type `QuMCWF` has the following fields : `eps` and `options`, the `options` is defaulted to an empty `Dict`,
but can be used to provide a solver using the keyword `:solver` which is defaulted to use `QuExpmV`, the
solver is required for propagating the state from `draw`. `eps` is the random number and `rand()` is used to generate `eps`.

The above implementation has been merged into the master and we have compared the results to QuTiP. Here is the
[notebook](https://github.com/amitjamadagni/Notes-Notebooks/blob/master/Notebooks/JC%20Model%20QuTiP%20in%20QuDynamics%20MCWF%20method.ipynb) which present the [QuTiP](http://qutip.org/docs/3.1.0/guide/dynamics/dynamics-monte.html) example. Also, we have worked on integrating some [examples](https://github.com/JuliaQuantum/QuDynamics.jl/pull/15) into the repo and
this involves Jaynes-Cummings Model using MCWF method.

I would like to conclude by providing an example of how Quantum MCWF method works in QuDynamics :

```julia
# System construction
ad = raiseop(2)
hamiltonian = ad*ad'
cs = coherentstatevec(2, 1.)
c_ops = [lowerop(2)]
tlist = 0.:0.25:2*pi
rho = complex(cs*cs')
rhos = Array(typeof(rho), length(tlist)-1)
qumcwfen = QuMCWFEnsemble(complex(cs), 1000)

# rhos to store density matrices at every time step
for i=1:length(tlist)-1
    rhos[i] = complex(zeros(rho))
end

# using MCWF to propagate and storing states at every time step
# looped over the number of trajectories (length(qumcwfen))
for psi0 in qumcwfen
    i = 1
    for (t,psi) in QuPropagator(hamiltonian, c_ops, psi0, tlist, QuMCWF([:solver=>QuODE45()]))
        rhos[i] = rhos[i] + (psi*psi')/length(qumcwfen)/norm(psi)^2
        i = i + 1
    end
end
```

The next targets include working on the documentation and also the related scripts.
