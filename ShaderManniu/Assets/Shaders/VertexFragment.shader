//顶点片元着色器
Shader "Custom/VertexFragment"
{
    SubShader
    {
       pass{
           CGPROGRAM
           //cg代码写在这两行之间

           //命名顶点函数
           #pragma vertex vert
           //命名片元函数 
           #pragma fragment frag

           void vert(in float2 objPos:POSITION, out float4 pos:POSITION, out float4 col:COLOR){
               pos = float4(objPos, 0, 1);//经过了摄像机的透视投影变换 cvv 立方体顶点数据（-0.5 , 0.5）
               col = pos;
           } 

           void frag(inout float4 col:COLOR){
                //col = float4(1, 0, 0, 0);    
                float r = 1;
                float g = 1;
                float b = 1;
                float a = 1;

                col = float4(r, g, b, a);
           }

           ENDCG
       }
    }
   
}
