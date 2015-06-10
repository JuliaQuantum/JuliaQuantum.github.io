---
layout: post
title: " GSoC2015: Weeks 1 and 2"
authors: Amit
date: "2015-06-09 11:36"
---

To begin with we have integrated some solvers into the repo, the repo can be used by cloning the package `QuDynmics`, since it depends on `QuBase` we also need to clone `QuBase`

```julia
julia> Pkg.clone("https://github.com/JuliaQuantum/QuBase.jl.git")

julia> Pkg.clone("https://github.com/JuliaQuantum/QuDynamics.jl.git")
```

During the past two weeks we have worked on the following :

  a. Common `QuPropagator` type which has the numerical method as one of the constructors.
  b. Common `QuPropagatorState` which has the current state, the current time and the current time state (the next index from time step list)
  c. `QuPropagatorMethod` parent of all the numerical methods.
  d. Docile integration
  e. Tests

The idea of `QuPropagator` is to unify the creation of parameters involved in solving the differential equation. Its creation also involves passing of the numerical method used to solve the problem. So for example:

```julia
Hamiltonian=sigmax

# Initial state
qv = normalize!(QuArray([0.5+0.1im, 0.2+0.2im]))

# Time steps
t = 0.:0.1:2*pi
```

For the above parameters, we construct the `QuPropagator` by :

```julia
QuPropagator(Hamiltonian, qv, t, QuEuler())
```

The last parameter being the subtype of `QuPropagatorMethod` which is the numerical method used to solve the equation (in this case
we are using the Euler Method).

Similarly, we could use Crank Nicolson Method by passing `QuCrankNicolson()` as the last parameter.

Presently, we have the following numerical methods :
<pre>
QuPropagatorMethod
|-- QuEuler
|-- QuCrankNicolson
|-- QuKrylov
</pre>

After the above construction we calculate the next evolved state by using iterator method `Base.next` which returns

```
(current_t, current_qustate), QuPropagatorState(current_qustate, current_t, t_state).
```

To see the iterator methods `Base.start`, `Base.next`, `Base.done` in action we do the following :

```julia
qe = QuPropagator(Hamiltonian, qv, t, QuEuler())
for (t, psi) in qe
    # time and the state
    println("$t $(psi[1]) $(psi[2])")
end

# which results in

0.1 0.8917926427410459 + 0.13719886811400706im 0.3601470287992685 + 0.25724787771376323im
0.2 0.9175174305124222 + 0.10118416523408019im 0.3738669156106692 + 0.16806861343965862im
0.30000000000000004 0.9343242918563881 + 0.06379747367301325im 0.3839853321340772 + 0.07631687038841638im
0.4 0.9419559788952298 + 0.025398940459605536im 0.39036507950137855 - 0.017115558797222416im
0.5 0.9402444230155075 - 0.013637567490532312im 0.3929049735473391 - 0.11131115668674536im
0.6000000000000001 0.929113307346833 - 0.05292806484526626im 0.39154121679828585 - 0.20533559898829618im
0.7000000000000001 0.9085797474480033 - 0.09208218652509484im 0.3862484103137592 - 0.29824692972297945im
0.8 0.8787550544757053 - 0.13070702755647076im 0.37704019166124975 - 0.3891049044677798im
0.9 0.8398445640289274 - 0.16841104672259571im 0.36396948890560266 - 0.4769804099153503im
1.0 0.7921465230373923 - 0.20480799561315596im 0.3471283842333431 - 0.560964866318243im
1.1 0.736050036405568 - 0.2395208340364903im 0.3266475846720275 - 0.6401795186219823im
.
.
.
.
.
.
4.9 -0.24467076054601963 + 0.4685969986051012im -0.14099590011126675 + 1.152831976674497im
5.0 -0.12938756287857034 + 0.48269658861622783im -0.09413620025075681 + 1.177299052729099im
5.1000000000000005 -0.011657657605659816 + 0.49211020864130356im -0.04586654138913377 + 1.190237809016956im
5.2 0.10736612329603537 + 0.4966968627802169im 0.0033444794749964077 + 1.191403574777522im
5.300000000000001 0.2265064807737882 + 0.49636241483271726im 0.053014165753018365 + 1.1806669624479185im
5.4 0.34457317701857965 + 0.49106099825741545im 0.10265040723628992 + 1.1580163143705398im
5.5 0.4603748084556332 + 0.4807959575337865im 0.15175650706203128 + 1.1235589966686819im
5.6000000000000005 0.572730708122502 + 0.4656203068275833im 0.1998361028154102 + 1.0775215158231184im
5.7 0.6804828597048135 + 0.4456366965460424im 0.24639813349816836 + 1.0202484450108684im
5.800000000000001 0.7825077042059009 + 0.4209968831962254im 0.2909618031527728 + 0.9522001590403867im
5.9 0.8777277201099392 + 0.39190070288094825im 0.3330614914723952 + 0.8739493886197969im
6.0 0.9651226589719185 + 0.35859455373370885im 0.3722515617604899 + 0.7861766166088032im
6.1000000000000005 1.0437403206327993 + 0.32136939755765964im 0.408111017133861 + 0.6896643507116109im
6.2 1.11270675570396 + 0.28055829584427366im 0.44024795688962687 + 0.5852903186483314im
```

We could also use other numerical methods by changing the last parameter in the `QuPropagator` construct :

```julia
# using Crank Nicolson
qcn = QuPropagator(Hamiltonian, qv, t, QuCrankNicolson())
for (t, psi) in qcn
    # time and the state
    println("$t $(psi[1]) $(psi[2])")
end

# using Krylov subspace
qkr = QuPropagator(Hamiltonian, qv, t, QuKrylov())
for (t, psi) in qkr
    # time and the state
    println("$t $(psi[1]) $(psi[2])")
end
```

We have worked on the tests, by comparing the results from the methods to the actual solution, which can be seen in the [pull-request](https://github.com/JuliaQuantum/QuDynamics.jl/pull/4). We hope to update the notebook to compare the various results.

The internal mechanism of the method `Base.next` is quite interesting, the generalized function dispatches to various `propagate` functions depending on the
numerical method used to solve the problem. The summary of the work can be found at the above pull.

The next targets include using the `ODE.jl` package and extending the functionality of the present solvers to use the `ode` solvers implemented. The gist of the idea is [here](https://gist.github.com/amitjamadagni/2b6c8aaf12c62e476288).
