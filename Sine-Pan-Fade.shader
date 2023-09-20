// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Sine-Pan-Fade"
{
	Properties
	{
		[Header(Swapping Textures)][NoScaleOffset]_Texture1("Texture 1", 2D) = "white" {}
		[NoScaleOffset]_Texture2(" Texture 2", 2D) = "white" {}
		_XTextureTiling("X Texture Tiling", Float) = 0
		_YTextureTiling("Y Texture Tiling", Float) = 0
		[Header(Panning)]_XPan("X Pan", Float) = 0
		_YPan("Y Pan", Float) = 0
		[Header(Horizontal Sine Wave)]_XSineWaveStrength("X Sine Wave Strength", Float) = 0
		_XSineWaveSize("X Sine Wave Size", Float) = 1
		_XSineSpeed("X Sine Speed", Float) = 1
		[Header(Vertical Sine Wave)]_YSineWaveStrength("Y Sine Wave Strength", Float) = 0
		_YSineWaveSize("Y Sine Wave Size", Float) = 1
		_YSineSpeed("Y Sine Speed", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
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

		uniform sampler2D _Texture2;
		uniform float _XPan;
		uniform float _YPan;
		uniform float _XSineWaveSize;
		uniform float _XSineSpeed;
		uniform float _XSineWaveStrength;
		uniform float _XTextureTiling;
		uniform float _YSineWaveSize;
		uniform float _YSineSpeed;
		uniform float _YSineWaveStrength;
		uniform float _YTextureTiling;
		uniform sampler2D _Texture1;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 appendResult86 = (float2(_XPan , _YPan));
			float UV_X10 = i.uv_texcoord.x;
			float UV_Y11 = i.uv_texcoord.y;
			float2 appendResult16 = (float2(( ( UV_X10 + ( sin( ( ( UV_Y11 * 6.2931 * _XSineWaveSize ) + ( _Time.y * _XSineSpeed ) ) ) * _XSineWaveStrength ) ) * _XTextureTiling ) , ( ( UV_Y11 + ( sin( ( ( UV_X10 * 6.2931 * _YSineWaveSize ) + ( _Time.y * _YSineSpeed ) ) ) * _YSineWaveStrength ) ) * _YTextureTiling )));
			float2 panner85 = ( 1.0 * _Time.y * appendResult86 + appendResult16);
			float4 lerpResult94 = lerp( tex2D( _Texture2, panner85 ) , tex2D( _Texture1, panner85 ) , (0.0 + (_SinTime.w - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)));
			o.Emission = lerpResult94.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.DynamicAppendNode;16;-911.0325,38.97996;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;85;-790.0718,139.3549;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;53;-529.6817,5.832923;Inherit;True;Property;_Texture2; Texture 2;1;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;29951010cb79fcd4ab7efb9dd13b44a2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;94;-209.5802,96.72073;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1;-540.4242,198.979;Inherit;True;Property;_Texture1;Texture 1;0;2;[Header];[NoScaleOffset];Create;True;1;Swapping Textures;0;0;False;0;False;-1;None;180bb97f5cb364948b53d9bcdfc7e570;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;63.3902,79.57597;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Sine-Pan-Fade;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3;-140.0776,-107.3036;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;10;90.48092,-104.7684;Inherit;False;UV_X;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;11;89.36654,-27.0399;Inherit;False;UV_Y;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;98;-426.6625,396.563;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinTimeNode;97;-595.8643,398.2421;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;86;-947.0553,375.3043;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-1101.951,453.2809;Inherit;False;Property;_YPan;Y Pan;5;0;Create;True;0;0;0;False;0;False;0;-0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;87;-1092.205,352.9319;Inherit;False;Property;_XPan;X Pan;4;1;[Header];Create;True;1;Panning;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;26;-1190.603,-137.2756;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-1058.682,-100.3065;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-1236.459,-30.9329;Inherit;False;Property;_XTextureTiling;X Texture Tiling;2;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;28;-1359.307,-164.8419;Inherit;False;10;UV_X;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-1359.836,-87.25351;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;27;-1477.162,-118.1303;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;-1597.012,-146.5937;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-1578.624,-40.61145;Inherit;False;Property;_XSineWaveStrength;X Sine Wave Strength;6;1;[Header];Create;True;1;Horizontal Sine Wave;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-1737.608,-220.6635;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;6.2931;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;31;-1939.272,-74.89519;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;38;-1744.694,-76.65993;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;33;-1904.531,-227.6387;Inherit;False;11;UV_Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-1977.534,-156.0778;Inherit;False;Property;_XSineWaveSize;X Sine Wave Size;7;0;Create;True;0;0;0;False;0;False;1;2.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;37;-1936.439,-3.659921;Inherit;False;Property;_XSineSpeed;X Sine Speed;8;0;Create;True;0;0;0;False;0;False;1;-2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;39;-1226.912,162.869;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;-1094.992,199.8381;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;41;-1390.615,142.3027;Inherit;False;11;UV_Y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;43;-1271.768,266.2118;Inherit;False;Property;_YTextureTiling;Y Texture Tiling;3;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-1393.145,217.8911;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;45;-1511.471,173.0143;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;44;-1617.933,272.5333;Inherit;False;Property;_YSineWaveStrength;Y Sine Wave Strength;9;1;[Header];Create;True;1;Vertical Sine Wave;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;46;-1631.321,172.5509;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;48;-1937.24,81.40589;Inherit;False;10;UV_X;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-1770.316,88.3812;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;6.2931;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;51;-1971.98,234.1495;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;-1777.806,248.5139;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;52;-1963.294,308.7739;Inherit;False;Property;_YSineSpeed;Y Sine Speed;11;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;49;-1990.243,156.3031;Inherit;False;Property;_YSineWaveSize;Y Sine Wave Size;10;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
WireConnection;16;0;24;0
WireConnection;16;1;40;0
WireConnection;85;0;16;0
WireConnection;85;2;86;0
WireConnection;53;1;85;0
WireConnection;94;0;53;0
WireConnection;94;1;1;0
WireConnection;94;2;98;0
WireConnection;1;1;85;0
WireConnection;0;2;94;0
WireConnection;10;0;3;1
WireConnection;11;0;3;2
WireConnection;98;0;97;4
WireConnection;86;0;87;0
WireConnection;86;1;88;0
WireConnection;26;0;28;0
WireConnection;26;1;34;0
WireConnection;24;0;26;0
WireConnection;24;1;25;0
WireConnection;34;0;27;0
WireConnection;34;1;35;0
WireConnection;27;0;30;0
WireConnection;30;0;32;0
WireConnection;30;1;38;0
WireConnection;32;0;33;0
WireConnection;32;2;36;0
WireConnection;38;0;31;0
WireConnection;38;1;37;0
WireConnection;39;0;41;0
WireConnection;39;1;42;0
WireConnection;40;0;39;0
WireConnection;40;1;43;0
WireConnection;42;0;45;0
WireConnection;42;1;44;0
WireConnection;45;0;46;0
WireConnection;46;0;47;0
WireConnection;46;1;50;0
WireConnection;47;0;48;0
WireConnection;47;2;49;0
WireConnection;50;0;51;0
WireConnection;50;1;52;0
ASEEND*/
//CHKSM=0B5A0D568ECF9CBC295EDE1A403DC715B24CE119