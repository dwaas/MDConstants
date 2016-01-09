
#######################################################################
                                 MDCONSTANTS
#######################################################################


Introduction
############

MDConstants is a C library that aids the loading of input.dat used in Molecular Dynamics Simulations.

Usage
#####
See tests/main.c for a minimal working example.
The tests also document the invalid behaviours of the library.

Once the MDConsts object is declared it needs to be initialised through InitializeMDConsts().
The MDConsts object is intended to be passed to every sub routine in the main instead of having global variables all round the scope.



Input.dat format
################

iteration_num

N[kDIM];                                        particle in each direction

L[kDIM];                                        length of the box in each direction

dcut;                                           cutoff range for geometric interactions

starting_branch;                                restart options;

v_0;                                            constant step of each particle

gamma_tilde;                                    relaxation contant in geometric interactions

delta_t;                                        length of a timestep

kappa   NF;                                     turbulent field intensity       modes used to compute it

t_gap   deltaS                                  calculate mean physical quantities every t_gap timesteps then print them to disk every deltaS timesteps



Requirements
============

* C99

also make check will require the following tools:

* cram: to run tests


