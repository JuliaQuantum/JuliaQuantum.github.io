---
layout: post
title: "QInfer got a Julia interface"
authors: Xiaodong Qi, Jonathan Gross
date: "2017-04-09 15:30"
---

[QInfer](http://qinfer.org/), as you may have known, has been a rising-star Python package for quantum information study based on the [Bayesian inference theory](https://en.wikipedia.org/wiki/Bayesian_inference).
As stated on its website, QInfer supports reproducible and accurate inference for quantum information processing theory and experiments, including frequency and Hamiltonian learning, quantum tomography and randomized benchmarking.
The package has a flexible interface with some well-known open source quantum simulation packages, like [QuTiP](http://qutip.org/).
Even better, it has now been equipped with a Julia interface!
You can call QInfer functions from Julia following the steps illustrated in the [official document](http://docs.qinfer.org/en/latest/guide/interop.html#julia-interoperability).


![QInfer and JuliaQuantum meetup--left to right are Xiaodong Qi, Christopher Granade, Jonathan Gross and CQuIC fellow Ninnat Dangniam.](/images/Meetups/qinfermeetup.jpg)

On Feb 24th, 2017, two of the QInfer creators, Christopher Granade and Jonathan Gross, met with JuliaQuantum's supporter, Xiaodong Qi during [SQuInT 2017](http://physics.unm.edu/SQuInT/2017/index.php) at Baton Rouge, Louisiana, USA, and discussed the current issues and future works of the package and what JuliaQuantum can do to improve user experience.
Because Julia has been developed as a fast technical computing language and more and more Julia packages have been developed for quantum simulations, people might want to call Julia scripts from Python.
But one of the concerns from Chris' past experience was the ability to call Julia from Python.
The known package which enabled one to call Julia from Python, [PyJulia](https://github.com/JuliaPy/pyjulia), had problems to call some Julia commands.
We hope this will be fixed once Julia is stablized after version 1.0 which could be done [soon](https://discourse.julialang.org/t/julia-1-0-in-2017/1830/12).

One direction the quantum community can work on, as said by Chris and Jonathan, is to develop a nice package for fully simulating quantum stochastic processes which will make studies on quantum tomography and simulations easier.
Currently, QuTiP has some limited capability to do that yet not enough.
Julia, as a high-performance language, could implement simulators much faster while can redesign the stochastic simulators from an in-depth level given the recent progress of the theory community.

Back to the Julia interface, as a wrapup, making a Julia interface from Python is possible and easy to achieve since the [`PyCall.jl`](https://github.com/stevengj/PyCall.jl) package was introduced by [Steven G. Johnson](http://math.mit.edu/~stevenj/) and fellows.
We hope more and more Python packages can be used friendly from Julia and more JuliaQuantum packages can be implemented in the near future!

Xiaodong Qi, Jonathan Gross
