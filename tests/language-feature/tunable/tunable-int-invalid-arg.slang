//DIAGNOSTIC_TEST:SIMPLE(diag=CHECK):

[Tunable("wide")]
public static const int TunableWidth = 2;
//CHECK: expected an expression of type 'int'
