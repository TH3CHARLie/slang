//TEST:SIMPLE(filecheck=CHECK): -target spirv-asm -entry main -stage compute

[Tunable(1, 2, 4, 8)]
public static const int TunableWidth = 2;

// CHECK: OpEntryPoint
[shader("compute")]
[numthreads(1,1,1)]
void main() {}
