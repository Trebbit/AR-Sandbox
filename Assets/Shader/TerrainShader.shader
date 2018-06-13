Shader "Custom/TerrainShader" {
	Properties {
		_WaterDeep ("WaterDeep", 2D) = "white" {}
		_WaterLow ("WaterLow", 2D) = "white" {}
		_Sand ("Sand", 2D) = "white" {}
		_Dirt ("Dirt", 2D) = "white" {}
		_GrassLight ("GrassLight", 2D) = "white" {}
		_GrassDark ("GrassDark", 2D) = "white" {}
		_RockLow ("RockLow", 2D) = "white" {}
		_RockMedium ("RockMedium", 2D) = "white" {}
		_RockHigh ("RockHigh", 2D) = "white" {}
		_MountainLow ("MountainLow", 2D) = "white" {}
		_MountainMedium ("MountainMedium", 2D) = "white" {}
		_MountainHigh ("MountainHigh", 2D) = "white" {}
		_WaterLevel ("Water Level", Float) = 0
		_LayerSize ("Layer Size", Float) = 20
		_BlendRange ("Blend Range", Range(0, 0.5)) = 0.1
	}
	SubShader {
		Pass {
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
     
            uniform sampler2D _WaterDeep;
            uniform sampler2D _WaterLow;
            uniform sampler2D _Sand;
            uniform sampler2D _Dirt;
            uniform sampler2D _GrassLight;
            uniform sampler2D _GrassDark;
            uniform sampler2D _RockLow;
            uniform sampler2D _RockMedium;
            uniform sampler2D _RockHigh;
            uniform sampler2D _MountainLow;
            uniform sampler2D _MountainMedium;
            uniform sampler2D _MountainHigh;

            uniform float _WaterLevel;
            uniform float _LayerSize;
            uniform float _BlendRange;

			struct fragmentInput {
				float4 pos : SV_POSITION;
                float4 texcoord : TEXCOORD0;
				float4 blend: COLOR;
			};
      
			fragmentInput vert (appdata_base v)
			{
				float NumOfTextures = 12;
				fragmentInput o;
				o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
                o.texcoord = v.texcoord;

				float MinValue = _WaterLevel - (NumOfTextures - 1) * _LayerSize; 
				float MaxValue = (_WaterLevel + _LayerSize); 
				float Blend = MaxValue - v.vertex.z;
				Blend = clamp(Blend / (NumOfTextures *_LayerSize), 0, 1);

				o.blend.xyz = 0;
				o.blend.w = Blend;
				return o;
			}
			

			inline float CalculateBlend(float TextureFloat)
			{
				return  1 - clamp((1 - TextureFloat) / _BlendRange, 0 , 1);
			}

			inline float4 DoBlending(float TextureID, float TextureFloat, fixed4 BaseTexture, fixed4 BlendTexture)
			{
				float Blend = CalculateBlend(clamp(TextureFloat - TextureID, 0 , 1));
				return lerp(BaseTexture, BlendTexture, Blend);
			} 

			float4 frag (fragmentInput i) : COLOR0 
			{ 	
				float NumOfTextures = 12;
				float TextureFloat = i.blend.w * NumOfTextures;

				if(TextureFloat < 1)
				{
					fixed4 WaterColor = tex2D(_WaterDeep, i.texcoord);
					fixed4 SandColor = tex2D(_WaterLow, i.texcoord);

					return DoBlending(0, TextureFloat, WaterColor, SandColor);
				} 
				else if(TextureFloat < 2)
				{
					fixed4 SandColor = tex2D(_WaterLow, i.texcoord);
					fixed4 GrassColor = tex2D(_Sand, i.texcoord);

					return DoBlending(1, TextureFloat, SandColor, GrassColor);
				} 
				else if(TextureFloat < 3)
				{
					fixed4 GrassColor = tex2D(_Sand, i.texcoord);
					fixed4 RockColor = tex2D(_Dirt, i.texcoord);

					return DoBlending(2, TextureFloat, GrassColor, RockColor);
				}
				else if(TextureFloat < 4)
				{
					fixed4 RockColor = tex2D(_Dirt, i.texcoord);
					fixed4 StoneColor = tex2D(_GrassLight, i.texcoord);

					return DoBlending(2, TextureFloat, RockColor, StoneColor);
				}
				else if(TextureFloat < 5)
				{
					fixed4 StoneColor = tex2D(_GrassLight, i.texcoord);
					fixed4 MountainColor = tex2D(_GrassDark, i.texcoord);

					return DoBlending(2, TextureFloat, StoneColor, MountainColor);
				}
				else if(TextureFloat < 6)
				{
					fixed4 StoneColor = tex2D(_GrassDark, i.texcoord);
					fixed4 MountainColor = tex2D(_RockLow, i.texcoord);

					return DoBlending(2, TextureFloat, StoneColor, MountainColor);
				}
				else if(TextureFloat < 7)
				{
					fixed4 StoneColor = tex2D(_RockLow, i.texcoord);
					fixed4 MountainColor = tex2D(_RockMedium, i.texcoord);

					return DoBlending(2, TextureFloat, StoneColor, MountainColor);
				}
				else if(TextureFloat < 8)
				{
					fixed4 StoneColor = tex2D(_RockMedium, i.texcoord);
					fixed4 MountainColor = tex2D(_RockHigh, i.texcoord);

					return DoBlending(2, TextureFloat, StoneColor, MountainColor);
				}
				else if(TextureFloat < 9)
				{
					fixed4 StoneColor = tex2D(_RockHigh, i.texcoord);
					fixed4 MountainColor = tex2D(_MountainLow, i.texcoord);

					return DoBlending(2, TextureFloat, StoneColor, MountainColor);
				}
				else if(TextureFloat < 10)
				{
					fixed4 StoneColor = tex2D(_MountainLow, i.texcoord);
					fixed4 MountainColor = tex2D(_MountainMedium, i.texcoord);

					return DoBlending(2, TextureFloat, StoneColor, MountainColor);
				}
				else if(TextureFloat < 11)
				{
					fixed4 StoneColor = tex2D(_MountainMedium, i.texcoord);
					fixed4 MountainColor = tex2D(_MountainHigh, i.texcoord);

					return DoBlending(2, TextureFloat, StoneColor, MountainColor);
				}
				
				fixed4 MountainHigh = tex2D(_MountainHigh, i.texcoord);

				return MountainHigh;
				
				fixed4 WaterLow = tex2D(_WaterLow, i.texcoord);
				fixed4 WaterDeep = tex2D(_WaterDeep, i.texcoord);
				return lerp(WaterLow, WaterDeep, i.blend.w);
				fixed4 SandColor = tex2D(_Sand, i.texcoord);
				fixed4 DirtColor = tex2D(_Dirt, i.texcoord);
				return lerp(SandColor, DirtColor, i.blend.w);
				fixed4 GrassLight = tex2D(_GrassLight, i.texcoord);
				fixed4 GrassDark = tex2D(_GrassDark, i.texcoord);
				return lerp(GrassLight, GrassDark, i.blend.w);
				fixed4 RockLow = tex2D(_RockLow, i.texcoord);
				fixed4 RockMedium = tex2D(_RockMedium, i.texcoord);
				return lerp(RockLow, RockMedium, i.blend.w);
				fixed4 RockHigh = tex2D(_RockHigh, i.texcoord);
				fixed4 MountainLow = tex2D(_MountainLow, i.texcoord);
				return lerp(RockHigh, MountainLow, i.blend.w);
				fixed4 MountainMedium = tex2D(_MountainMedium, i.texcoord);
			}

      ENDCG
    }
  } 
	FallBack "Diffuse"
}