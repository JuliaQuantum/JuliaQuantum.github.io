---
layout: default
title:  Projects - Julia Libraries for Quantum Science and Technology
---

Below is an overview of the open-source projects that have been carried on under the JuliaQuantum organization.
As a fairly new organization for the fresh programming language--Julia,
we hope our projects can span into a good base for the broad spectrum of quantum science and technology.
If you have an idea on starting a new project, find a bug or have something to say to our developers,
please [file an issue](https://guides.github.com/features/issues/) following [the Julia community standards](http://julialang.org/community/standards/) on the listed repositories below.
Our current major focus is the [QuBase.jl](https://github.com/JuliaQuantum/QuBase.jl) project as a fundamental project for building other packages. As the QuBase.jl is closing to release the first version, we are looking for proposals and prototypes of advanced projects for the next development focus. Please check the [overall roadmaps](https://github.com/JuliaQuantum/Roadmap) and issues on existing projects to find out where you can make a contribution.
You can [watch](https://help.github.com/articles/watching-repositories/) or [star](https://github.com/blog/1204-notifications-stars) our projects to receive notifications of updates.
Contact the steering team through the email linked on the bottom of this page if you want to be a member of JuliaQuantum--the [Basic Agreement](https://github.com/JuliaQuantum/JuliaQuantum.github.io/issues/3) is under community discussion.
[Fork](https://help.github.com/articles/fork-a-repo/) and edit our projects and start [contributing source codes](https://github.com/JuliaLang/julia/blob/master/CONTRIBUTING.md)!
Thank you for your interest!

### [JuliaQuantum.github.io](https://github.com/JuliaQuantum/JuliaQuantum.github.io)

This is the GitHub repository for the JuliaQuantum organization's main website,
[juliaquantum.github.io](http://juliaquantum.github.io).
Organizational announcements, Q&A and general discussions regarding the JuliaQuantum organization and overall projects
can also be posted on its [issue page](https://github.com/JuliaQuantum/JuliaQuantum.github.io/issues).
Please [watch](https://help.github.com/articles/watching-repositories/) or [star](https://github.com/blog/1204-notifications-stars) this repository to receive prompt notifications of the organizational activities.


### [Roadmap](https://github.com/JuliaQuantum/Roadmap)

This repository hosts discussions and documentations of long-term and short-term roadmaps for projects
under JuliaQuantum.
Proposals of new projects under the organization can be posted on its [issue page](https://github.com/JuliaQuantum/Roadmap/issues).
Please [watch](https://help.github.com/articles/watching-repositories/) or [star](https://github.com/blog/1204-notifications-stars) this repository to receive prompt notifications if interested.

### [Resources](https://github.com/JuliaQuantum/Resources)

This repo stores some public resources from JuliaQuantum including meetup slides, educational demos and so on.


### [QuBase.jl](https://github.com/JuliaQuantum/QuBase.jl)

A foundational library for quantum mechanics in Julia.
It aims to provide a unifying type structure and set of basic functions for computational quantum mechanics.
This repo is currently a work in progress,
and is basically built upon the [QuDirac.jl](https://github.com/JuliaQuantum/QuDirac.jl) project
started by [jrevels](https://github.com/jrevels).

### [QuDirac.jl](https://github.com/JuliaQuantum/QuDirac.jl)

A library for performing quantum mechanics using Dirac notation in Julia.
Some of its functionalities have been merged into the [QuBase.jl](https://github.com/JuliaQuantum/QuBase.jl) project
as a joint effort for building a basic quantum representation library for high-level JuliaQuantum projects.

### [QuDynamics.jl](https://github.com/JuliaQuantum/QuDynamics.jl)

A library for solving dynamical equations in quantum mechanics.
It aims to provide a unified framework to solve various dynamical equations like
Schrodinger Equation, Liouville von Neumann Equation, Lindblad Master Equation. Various solvers
have been integrated from packages like [ODE.jl](https://github.com/JuliaLang/ODE.jl), [ExpmV.jl](https://github.com/marcusps/ExpmV.jl),
[Expokit.jl](https://github.com/acroy/Expokit.jl). Currently it depends on and makes use of features from
[QuBase.jl](https://github.com/JuliaQuantum/QuBase.jl).


### [QuCmp.jl](https://github.com/JuliaQuantum/QuCmp.jl)

A framework and toolkit for simulating quantum information processing.

This framework is inspired by:
[Quantum++](https://github.com/vsoftco/qpp),
[libquantum](http://www.libquantum.de/), and other related libraries.
