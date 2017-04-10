---
layout: post
title: "QInfer got a Julia interface"
authors: Xiaodong Qi, Jonathan Gross
date: "2017-04-09 15:30"
---

[QInfer](http://qinfer.org/), as you may know, is a rising-star Python package for quantum-information study based on [Bayesian inference theory](https://en.wikipedia.org/wiki/Bayesian_inference).
As stated on its website, QInfer supports reproducible and accurate inference for quantum-information-processing theory and experiments, including frequency and Hamiltonian learning, quantum tomography and randomized benchmarking.
The package has a flexible interface with some well-known open-source quantum-simulation packages, like [QuTiP](http://qutip.org/).
Even better, it has now been equipped with a Julia interface!
You can call QInfer functions from Julia following the steps illustrated in the [official document](http://docs.qinfer.org/en/latest/guide/interop.html#julia-interoperability).


![QInfer and JuliaQuantum meetup--left to right are Xiaodong Qi, Christopher Granade, Jonathan Gross and CQuIC fellow Ninnat Dangniam.](/images/Meetups/qinfermeetup.jpg)

On Feb 24th, 2017, QInfer lead developer Christopher Granade and contributor Jonathan Gross met with JuliaQuantum supporter Xiaodong Qi during the [SQuInT](http://physics.unm.edu/SQuInT/2017/index.php) workshop in Baton Rouge, Louisiana, USA. They discussed current issues and future directions of the package and what JuliaQuantum can do to improve user experience.
Because Julia has been developed as a fast technical-computing language and many Julia packages have been developed for quantum simulation, people might want to call Julia scripts from Python.
Chris raised some concerns base on his past experience attempting to call Julia from Python,
specifically that the package enabling one to call Julia from Python, [PyJulia](https://github.com/JuliaPy/pyjulia), has problems calling certain Julia commands.
We hope this will be fixed once Julia is stablized after version 1.0, which could be done [soon](https://discourse.julialang.org/t/julia-1-0-in-2017/1830/12).

One direction Chris and Jonathan mentioned the quantum community could move in is development of a nice package for fully simulating quantum stochastic processes, which would make studies on quantum tomography and simulation easier.
QuTiP currently has some limited capability in this regard, but there is room for improvement.
Julia, as a high-performance language, has the potential to facilitate faster simulators stochastic integrators whose design could benefit from recent progress in the theory community.

Back to the Julia interface, as a wrapup, making an interface to call Python from Julia is possible and easy to achieve since the [`PyCall.jl`](https://github.com/stevengj/PyCall.jl) package was introduced by [Steven G. Johnson](http://math.mit.edu/~stevenj/) and fellows.
We hope more and more Python packages can be easily accessed from Julia and more JuliaQuantum packages can be implemented in the near future!

Xiaodong Qi, Jonathan Gross
