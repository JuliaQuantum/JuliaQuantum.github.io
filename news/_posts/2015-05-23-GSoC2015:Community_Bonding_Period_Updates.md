---
layout: post
title: " GSoC2015:Community Bonding Period Updates"
authors: Amit
date: "2015-05-23 01:38"
---

There has been a lot of activity between this and the previous update. I would like to present some of the them

We have worked on the Euler and Crank Nicholson method. There have been many iterations in making the code more efficient. The code for the methods has been presented in the following gist :
https://gist.github.com/amitjamadagni/c77f10b517fefe55702b

_Commentary on the gist_:

  a. Initially we had used progression over the time steps (which is currently commented in the above gist)
  b. Then we moved onto using the `Base.start`, `Base.next`, `Base.done` iterator methods. This was just to get a hold on the methods
     as it would further help when we create the iterator methods for various solvers. There was no change in efficiency with respect to the second approach when compared to first as the second one had the first under the hood.
  c. Referring to the gist, we have used `tic`, `toc` methods for the timing analysis and `@allocated` macro for evaluating the memory allocated.

In the process of implementing the Crank Nicholson method, which relies on matrix division, we had to implement the feature in QuBase.jl, that
is to provide support for matrix division (A*X==B, X=\(A,B)) where A and B are `AbstractQuMatrix` and `AbstractQuMatrix`, `AbstractQuMatrix` and `AbstractQuVector`. This had to worked upon, as there was another important PR which was headed in implementation of `similar_type` which dealt
with the type priority which I had mentioned in the previous blog post. Finally after the PR on `similar_type` was in, we had the PR on matrix division also on the master of `QuBase.jl`

We have also worked on creating Notes for derivations of methods and Notebooks for examples as a part of the project
at [Notes and Notebooks](https://github.com/amitjamadagni/Notes-Notebooks). The examples are in the form of a IJulia notebooks ([for example : Solvers.ipynb](https://github.com/amitjamadagni/Notes-Notebooks/blob/master/Notebooks/Solvers.ipynb)) and can be used on similar lines of IPython notebooks. We have also worked on setting up the QuDynamics.jl repo (updated the README.md and REQUIRE files) and worked on few other enhancements.

  By the next update we aim to:

  1. Present the iterator methods customized for solver types (an attempt has already been made [here](https://gist.github.com/amitjamadagni/c051bcf23726a54f982d)) and create a PR regarding the same on QuDynamics.jl.
  2. Get QuDynamics.jl work with Docile Documentation
  3. Work on Krylov subspace method, and try integrating with the existing packages.
