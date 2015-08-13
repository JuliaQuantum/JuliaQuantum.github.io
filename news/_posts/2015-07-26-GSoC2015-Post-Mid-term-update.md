---
layout: post
title: " GSoC2015: Post Mid-term update"
authors: Amit
date: "2015-07-26 13:12"
---

Hello everyone,

During the past few weeks we have made some decent progress and here is a gist of updates :

1. All the PR's from the previous blog post are now in, which implies we have support for
    a. Solver `expmv` from both the packages `ExpmV.jl` and `Expokit.jl`
    b. Liouville von Neumann Equation types and constructs.

2. In addition to the above we have support for Lindblad Master Equation and most of the blog post
   would be about the related constructs.

3. There have also been few additions to `QuBase.jl`
    a. From the previous blog, the [PR](https://github.com/JuliaQuantum/QuBase.jl/pull/37) on `vec` is now in.
    b. We had a fix on multiplication, [PR](https://github.com/JuliaQuantum/QuBase.jl/pull/39), we had spotted this as we were testing out Lindblad based examples.
    c. PR has been opened to support `Base.complex` function for QuArray (this requirement was spotted while working on ODE related solvers)

To begin with, Lindblad Master Equation type `QuLindbladMasterEq` has fields `lindblad`, `hamiltonian` and `collapse_ops` which are the
lindblad operator, hamiltonian and the collapse operators of the system. The lindblad operator is constructed from the function `lindblad_op`
which accepts the hamiltonain and vector. The vector here is of type `Any` and we still have some design issues which will be summarized at the
end, it would be great to hear from the community on the possibilities of solving these. The `liouvillian_op` is constructed from `lindblad_op`
by passing an empty array to the vector parameter. The reason for caching Lindblad operator in type construct is that we do not need to construct it
over and over again by the use of `operator` or other means, this turns out to be advantageous for time-independent hamiltonian cases. This is
also consistent with the `QuLiouvillevonNeumannEq` type where we cache the `liouvillian` in the type construct itself. The two issues we
currently have are the following :

  a. Design of time dependent and time independent lindblad operator constructs, we need to think of ways to support time-dependent nature.
  b. Promotion rule for collapse operators, as of now we cannot construct something like

```julia
c_ops_1 = [sigmax, sigmay]
c_ops_2 = [sigmax, lowerop(2)]
```

We need to have promotion rules to support such kind of constructions.

Moving on, we have added the additional constructs for `QuPropagator` which  accepts

1. `QuLindbladMasterEq` and `AbstractQuMatrix`.
2. `AbstractQuMatrix` and `Vector{AbstractQuMatrix}`, constructs a `QuLindbladMasterEq` from `AbstractQuMatrix` and `Vector{AbstractQuMatrix}`.

We have worked on porting Jaynes Cummings by QuTiP to Julia. We would like to thank QuTiP developers for having shared the notebook, below are both
the versions

1. [Jaynes - Cummings using QuTiP](https://github.com/amitjamadagni/Notes-Notebooks/blob/master/Notebooks-python/JC%20Results%20and%20Benchmarks.ipynb)
2. [Jaynes - Cummings using QuDynamics](https://github.com/amitjamadagni/Notes-Notebooks/blob/master/Notebooks/JC%20model%20-%20%20QuTiP%20in%20QuDynamics.ipynb)

We have also done benchmarking analysis for various solvers using the package `BenchmarkLite.jl`. We have added the code under `perf` in the repo which has the
benchmarking analysis for Jaynes Cummings model and Quantum Harmonic Oscillator. The results have been presented in the [notebook](https://github.com/amitjamadagni/Notes-Notebooks/blob/master/Notebooks/Jaynes%20Cummings%20Benchmarks.ipynb), but there is still a need to refine it.

A quick summary on the PR's :

1. [PR](https://github.com/JuliaQuantum/QuDynamics.jl/pull/16) 16 (merged) [Equation types, expo solvers, tests and docs] has [PR](https://github.com/JuliaQuantum/QuDynamics.jl/pull/13) 13 (closed) [expo solvers, tests and docs] and [PR](https://github.com/JuliaQuantum/QuDynamics.jl/pull/14) 14 (closed) [revamped tests]
2. [PR](https://github.com/JuliaQuantum/QuDynamics.jl/pull/17) 17 (merged) had an updated README.md
3. [PR](https://github.com/JuliaQuantum/QuDynamics.jl/pull/18) 18 (merged) has the constructs of Lindblad Master Equation
4. [PR](https://github.com/JuliaQuantum/QuDynamics.jl/pull/20) 20 (merged) has performance analysis of Jaynes Cummings Model and Quantum Harmonic Oscillator which has been done using `BenchmarkLite.jl`

On QuBase, we have an open [PR](https://github.com/JuliaQuantum/QuBase.jl/pull/38) on adding `Base.complex` to QuArray.

The next targets would be to start working on the implementation of Quantum Monte Carlo Wavefunction method and then extend the current framework to support parallelization techniques.
