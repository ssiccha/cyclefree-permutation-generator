gap> gen := InitCyclefreePermutationGenerator(0);
Error, InitCyclefreePermutationGenerator: n must be a positive integer and not\
 0.
gap> gen := InitCyclefreePermutationGenerator([]);
Error, InitCyclefreePermutationGenerator: n must be a positive integer and not\
 [  ].
gap> gen := InitCyclefreePermutationGenerator(1);
rec( cyclefreePermutation := 0, cyclefreePermutationSeed := (), 
  iteratorExponents := 1, structurePreservingExponents := [ 1 ], 
  symmetricGroupWithRandomSeed := Group(()) )
gap> cycfree := GenerateCyclefreePermutation(gen);
()
gap> cycfree := GenerateCyclefreePermutation(gen);
()
gap> gen := InitCyclefreePermutationGenerator(2);
rec( cyclefreePermutation := 0, cyclefreePermutationSeed := (1,2), 
  iteratorExponents := 1, structurePreservingExponents := [ 1 ], 
  symmetricGroupWithRandomSeed := Sym( [ 1 .. 2 ] ) )
gap> cycfree := GenerateCyclefreePermutation(gen);
(1,2)
gap> cycfree := GenerateCyclefreePermutation(gen);
(1,2)
gap> cycfree := GenerateCyclefreePermutation(gen);
(1,2)
gap> cycfree := GenerateCyclefreePermutation(gen);
(1,2)
gap> cycfree := GenerateCyclefreePermutation(gen);
(1,2)
