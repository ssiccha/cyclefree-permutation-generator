# Make sure we have a clean random state.
gap> START_TEST("correctness.tst");

# Test with CycleStructurePerm
# Generate 100 random `n`s.
# For each n we create 1000 cycle free permutations.
gap> for i in [1..100] do
> n := Random(3,10000);
> Print(n, "\n");
> gen := InitCyclefreePermutationGenerator(n);
> cycleStructure := [];
> cycleStructure[n-1] := 1;
> for j in [1..1000] do
> cycleFreePerm := GenerateCyclefreePermutation(gen);
> if not CycleStructurePerm(cycleFreePerm) = cycleStructure then
>   Error("Wrong cycle structure!");
> fi;
> od;
> od;
3840
7034
1205
5278
9781
6695
5812
1319
2095
546
5647
9619
5996
2554
5852
2024
4761
7694
294
5743
9161
7698
2597
7824
5197
5429
5905
6917
6961
7539
7618
162
3105
5532
8695
7149
8282
4060
7321
827
292
7393
7544
5082
3606
3601
8218
6574
7468
9428
6416
4373
2171
689
8906
5332
393
9833
4306
2265
5112
9197
287
7090
735
4642
4699
7796
9958
892
1626
350
3813
5969
4611
908
7578
1597
3910
7788
24
3037
5477
771
4967
1381
6241
2218
5644
8780
5954
1191
6950
7690
488
1400
9956
8953
2746
9472
gap> STOP_TEST("correctness.tst");
