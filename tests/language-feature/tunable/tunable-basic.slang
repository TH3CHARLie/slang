//TEST:SIMPLE(filecheck=CHECK): -target spirv-asm -entry main -stage compute

interface IFoo { float compute(float x); }
struct FooA : IFoo { float compute(float x) { return x * 2.0; } }
struct FooB : IFoo { float compute(float x) { return x + 1.0; } }

[Tunable]
public extern struct MyTunable : IFoo = FooA;

// CHECK: OpEntryPoint
[shader("compute")]
[numthreads(1,1,1)]
void main() {}
