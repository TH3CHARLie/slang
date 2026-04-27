//DIAGNOSTIC_TEST:SIMPLE(diag=CHECK):

[Tunable("wide")]
//CHECK:       ^ type mismatch in expression
//CHECK: expected an expression of type 'int'
public static const int TunableWidth = 2;
