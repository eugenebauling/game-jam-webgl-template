Shader "Hayq Art/Water_Shader"
{
	Properties
	{
		[HideInInspector] _texcoord("", 2D) = "white" {}
		[HideInInspector] __dirty("", Int) = 1
	}

		SubShader
		{
			Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
			Cull Back
			CGPROGRAM
			#include "UnityShaderVariables.cginc"
			#pragma target 3.0
			#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
			struct Input
			{
				float2 uv_texcoord;
			};


			float2 voronoihash1(float2 p)
			{

				p = float2(dot(p, float2(127.1, 311.7)), dot(p, float2(269.5, 183.3)));
				return frac(sin(p) * 43758.5453);
			}


			float voronoi1(float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId)
			{
				float2 n = floor(v);
				float2 f = frac(v);
				float F1 = 8.0;
				float F2 = 8.0; float2 mg = 0;
				for (int j = -1; j <= 1; j++)
				{
					for (int i = -1; i <= 1; i++)
					{
						float2 g = float2(i, j);
						float2 o = voronoihash1(n + g);
						o = (sin(time + o * 6.2831) * 0.5 + 0.5); float2 r = f - g - o;
						float d = 0.5 * dot(r, r);
						if (d < F1) {
							F2 = F1;
							F1 = d; mg = g; mr = r; id = o;
						}
	 else if (d < F2) {
	  F2 = d;

  }
}
}
return F1;
}


void surf(Input i , inout SurfaceOutputStandard o)
{
	float4 color5 = IsGammaSpace() ? float4(0.01663781,1.059274,0.1885618,0) : float4(0.001287756,1.135058,0.02965215,0);
	o.Albedo = color5.rgb;
	float time1 = (_Time.y * 1.0);
	float2 voronoiSmoothId1 = 0;
	float2 coords1 = i.uv_texcoord * 200.0;
	float2 id1 = 0;
	float2 uv1 = 0;
	float voroi1 = voronoi1(coords1, time1, id1, uv1, 0, voronoiSmoothId1);
	float4 color4 = IsGammaSpace() ? float4(0,1.160784,2.996078,0) : float4(0,1.388204,11.17936,0);
	o.Emission = (pow(voroi1 , 2.0) * color4).rgb;
	o.Smoothness = 0.0;
	o.Alpha = 1;
}

ENDCG
		}
			Fallback "Diffuse"
}