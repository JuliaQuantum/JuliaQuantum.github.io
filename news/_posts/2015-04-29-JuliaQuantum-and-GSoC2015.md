---
layout: post
title: "JuliaQuantum and Google Summer of Code 2015"
authors: Amit
date: "2015-04-29 01:38"
---

I am really happy to inform the JuliaQuantum community that the project titled **JuliaQuantum : Framework for Solvers** has been accepted as a part of *Google Summer of Code 2015*. I would be working under the mentorship of Alexander Croy and we would be working on developing a framework for solvers used in Quantum Mechanics. The main aim of the blog is to introduce the project, the requirements behind the project and also a little about how I got interested in *JuliaQuantum*.

The main aim of the project, as mentioned, is to have a framework for solving the Schrodinger's and Quantum Master Equation using various solvers. The different solvers include :

 * ODE Solvers (based on Runge-Kutta methods)
 * Exponential Solvers
 * Monte-Carlo Wave Function Method (MCWF)
 * Steady State Solvers

The project aims at integrating the already exisiting packages (for example in case of ODE Solvers, we could have ODE.jl) instead of establishing everything from the scratch. Similarly we would be referring to packages like Expokit.jl and Expmv.jl for exponential solvers, QuDOS.jl for MCWF and QuTiP for Steady State Solvers. I would like to mention that we would be referring to **QuTiP** at various stages of the project for testing the results as well as performance of our implementation. More about the design has been discussed [here](https://github.com/JuliaQuantum/JuliaQuantum.github.io/issues/20) and also the draft of the proposal can be viewed [here](https://github.com/JuliaQuantum/Resources/pull/1)

Once we have the initial framework for solvers, we would be aiming to parallelize the implementation at various stages i.e., at an abstract level as QuArray is dependent on Arrays and also at various stages in the methods.

As per the schedule of the project we are currently in the Community Bonding Period and here is my understanding of how things are moving and also what we plan to achieve before the coding period :

1. Currently there is a [pull request](https://github.com/JuliaQuantum/QuBase.jl/pull/29) in progress to replace the `Union(QuArray, CTranspose)` type with something more abstract like `AbstractQuArray` and then having subtypes of this and each subtype should have `coefftype` which gives the type of the coefficients, `rawcoeffs` the coefficients themselves, `rawbases` the related bases, and `copy` which gives a copy of the construct. So the type structure is something like

`AbstarctQuArray` --- top-node
      |
      | ---  `QuArray`
      | ---  `CTranspose` (immutable)
      | ---  `QuDensity` (TBI)

Regarding the promotion rules, this was a bit difficult to understand at first but here is what I could get from the PR
Suppose we have a `QuArray` and `CTranpose` and we need to operate with an instance from each, then we need a rule to decide which type instance would be returned and hence the promotion rule. The latest being that we default to QuArray if they are two different types.

2. I guess we should be having the `QuDensity` type to progress further and this would be the main target to be achieved by the end of the Community Bonding Period.

I also would like to mention about how it all started for me, I was going through the sage-devel mailing list and came across Julia. Anxious enough I wanted to chip in with some contributions, luckily I could find a `TODO` task and with great help from community I was able to enhance the rotation of bits function, which is now in the master. I got more interested and started to go through the packages and I was excited as I came across *JuliaQuantum*. Initially it was a bit tough for me to understand the implementation design, but with some great guidance from Alex, Jarrett and Qi I was able to chip in with some contributions. GSoC announcement came along and again with some great help from the community I could draft a proposal . Then came 27th April and we had been offered a slot under NumFOCUS to work on the project as a part of GSoC. I will try my best to keep everyone on the team updated about the progress of the project and also would request everyone to chip in with reviews and ideas so that we deliver a great package to the open source community.
