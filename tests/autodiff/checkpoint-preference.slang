//TEST(compute):COMPARE_COMPUTE_EX(filecheck-buffer=CHECK): -slang -compute -shaderobj -output-using-type
//TEST(compute, vulkan):COMPARE_COMPUTE_EX(filecheck-buffer=CHECK): -vk -compute -shaderobj -output-using-type

extern static const bool PREFER_RECOMPUTE = false;
extern static const bool PREFER_CHECKPOINT = true;

[Differentiable]
[CheckpointPreference(PREFER_RECOMPUTE)]
float inner(float x)
{
    return x * x;
}

[Differentiable]
[CheckpointPreference(PREFER_CHECKPOINT)]
float outer(float x)
{
    return inner(x) + x;
}

//TEST_INPUT:ubuffer(data=[0], stride=4):out,name=outputBuffer
RWStructuredBuffer<float> outputBuffer;

[shader("compute")]
[numthreads(1, 1, 1)]
void computeMain(uint3 dtid : SV_DispatchThreadID)
{
    DifferentialPair<float> x = diffPair(3.0f);
    bwd_diff(outer)(x, 1.0f);
    outputBuffer[0] = x.d;
    // CHECK: 7.0
}
