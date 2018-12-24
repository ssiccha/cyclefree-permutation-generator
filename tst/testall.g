srcDir := "/home/sergio/src/cyclefree-permutation-generator/";
Read(Concatenation(srcDir, "cyclefree-permutation-generator.g"));

# standard
TestDirectory(
    Concatenation(srcDir, "tst/standard"),
    rec(exitGAP := true)
);

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
