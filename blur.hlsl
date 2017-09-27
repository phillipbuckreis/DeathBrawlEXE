Texture2D Texture: register(t0);

SamplerState gTriLinearSam{
  Filter = ANISOTROPIC;
}; //SamplerState

float4 main(float4 posH: SV_POSITION,  float2 texo: TEXCOORD): SV_TARGET{
  int width, height;
  Texture.GetDimensions(width, height);

  float4 ColorOut = Texture.Sample(gTriLinearSam, texo);
  float4 Color1, Color2, Color3, Color4, Color5, Color6, Color7, Color8;
  float2 i;
  float delta_x = 1.0f/width;
  float delta_y = 1.0f/height;
  i = texo + float2 (0.0, delta_y);
  Color1 = Texture.Sample(gTriLinearSam, i);
  i = texo + float2 (delta_x, delta_y);
  Color2 = Texture.Sample(gTriLinearSam, i);
  i = texo + float2 (delta_x, 0.0);
  Color3 = Texture.Sample(gTriLinearSam, i);
  i = texo + float2 (delta_x, -delta_y);
  Color4 = Texture.Sample(gTriLinearSam, i);
  i = texo + float2 (0.0, -delta_y);
  Color5 = Texture.Sample(gTriLinearSam, i);
  i = texo + float2 (-delta_x, -delta_y);
  Color6 = Texture.Sample(gTriLinearSam, i);
  i = texo + float2 (-delta_x, 0.0);
  Color7 = Texture.Sample(gTriLinearSam, i);
  i = texo + float2 (-delta_x, delta_y);
  Color8 = Texture.Sample(gTriLinearSam, i);
  
  ColorOut.r = (ColorOut.r + Color1.r + Color2.r + Color3.r + Color4.r + Color5.r + Color6.r + Color7.r + Color8.r) / 9.0;
  ColorOut.g = (ColorOut.g + Color1.g + Color2.g + Color3.g + Color4.g + Color5.g + Color6.g + Color7.g + Color8.g) / 9.0;
  ColorOut.b = (ColorOut.b + Color1.b + Color2.b + Color3.b + Color4.b + Color5.b + Color6.b + Color7.b + Color8.b) / 9.0;
  
  return ColorOut;
} //main

