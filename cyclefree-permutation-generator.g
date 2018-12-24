InitCyclefreePermutationGenerator := function(n)
    local generator, startCycle, structurePreservingExponents, sym;
    if not IsPosInt(n) then
        Error("InitCyclefreePermutationGenerator: ",
              "n must be a positive integer and not ", n, ".");
    fi;
    generator := rec(
        cyclefreePermutationSeed := 0,
        cyclefreePermutation := 0,
        structurePreservingExponents := 0,
        iteratorExponents := 0,
        symmetricGroupWithRandomSeed := 0
    );
    # Create first seed
    startCycle := PermList(Concatenation([2..n], [1]));
    generator.cyclefreePermutationSeed := startCycle;
    # Compute all exponents that preserve the cycle structure
    structurePreservingExponents := Filtered([1..n], i -> GcdInt(i, n) = 1);
    generator.structurePreservingExponents := structurePreservingExponents;
    # Set iteratorExponents
    generator.iteratorExponents := Length(
        generator.structurePreservingExponents
    );
    # Create the full symmetric group and initialise the product replacement
    # algorithm
    sym := SymmetricGroup(n);
    PseudoRandom(sym);
    generator.symmetricGroupWithRandomSeed := sym;
    return generator;
end;

# Returns a new cyclefreePermutation and updates the generator's state.
GenerateSingleCyclefreePermutation := function(generator)
    local iteratorExponents, structurePreservingExponents, conjugator,
        cyclefreePermutation, e;
    iteratorExponents := generator.iteratorExponents;
    structurePreservingExponents := generator.structurePreservingExponents;
    if iteratorExponents = Length(generator.structurePreservingExponents) then
        # We have used all exponents in structurePreservingExponents.
        # Thus we create a new permutation seed by conjugating the old seed.
        conjugator := PseudoRandom(generator.symmetricGroupWithRandomSeed);
        generator.cyclefreePermutationSeed :=
            generator.cyclefreePermutationSeed ^ conjugator;
        generator.cyclefreePermutation := generator.cyclefreePermutationSeed;
        generator.iteratorExponents := 1;
        return generator.cyclefreePermutation;
    fi;
    # Compute cyclefreePermutationSeed ^ exponent for next exponent in
    # structurePreservingExponents.
    iteratorExponents := iteratorExponents + 1;
    cyclefreePermutation := generator.cyclefreePermutation;
    e := generator.structurePreservingExponents[iteratorExponents]
        - generator.structurePreservingExponents[iteratorExponents - 1];
    cyclefreePermutation := cyclefreePermutation
        * generator.cyclefreePermutationSeed ^ e;

    # Update generator
    generator.iteratorExponents := iteratorExponents;
    generator.cyclefreePermutation := cyclefreePermutation;
    return cyclefreePermutation;
end;

# Returns a single cyclefree permutation or a list of cyclefree permutations
# and updates the generator's state.
GenerateCyclefreePermutation := function(generator, args...)
    local numberCycles;
    if Length(args) = 0 then
        return GenerateSingleCyclefreePermutation(generator);
    fi;
    numberCycles := args[1];
    return List([1..numberCycles],
                x -> GenerateSingleCyclefreePermutation(generator));
end;
