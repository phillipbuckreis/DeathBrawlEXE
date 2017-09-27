Texture2D Texture: register(t0);

SamplerState gTriLinearSam{
  Filter = ANISOTROPIC;
}; //SamplerState

float4 main(float4 posH: SV_POSITION,  float2 texo: TEXCOORD): SV_TARGET{
  float4 color = Texture.Sample(gTriLinearSam, texo);

  color.rgb = (color.r/2 + color.g/2 + color.b/2.0f)/2.0f;

  color.rb = 1.0f;

  return color;
} //main