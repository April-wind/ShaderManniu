Shader "Custom/FixedShader2"
{
    Properties
    {
        _Color("Main Color", color) = (1, 1, 1, 1)
        _Ambient("Ambient", color) = (0.3, 0.3, 0.3, 0.3)
        _Specular("Specular", Color) = (1, 1, 1, 1)
        _Shininess("Shininess", Range(0, 8)) = 4
        _Emission("Emission", color) = (1, 1, 1, 1)
        _Constant("ConstantColor", Color) = (1, 1, 1, 0.3)
        _MainTex("MainTex", 2D) = ""
        _SecondTex("SecondTex", 2D) = ""  
    }
    SubShader
    {
        //渲染队列
        Tags{ "Queue" = "Transparent" }

        pass{
            // color(1, 1, 1, 1)
            //color[_Color]
            Blend srcAlpha OneMinusSrcAlpha
            Material{
                //漫反射颜色
                diffuse[_Color]
                 
                ambient[_Ambient]

                //高光
                specular[_Specular]
                //高光区域
                shininess[_Shininess]
                
                //自发光
                emission[_Emission]
            }
            //开启光照
            Lighting On

            //镜面高光开启
            SeparateSpecular on

            SetTexture[_MainTex]{
                Combine texture * primary double //_MainTex乘以之前计算的光照颜色的两倍
            }
            SetTexture[_SecondTex]{
                ConstantColor[_Constant]
                Combine texture * previous double, texture * constant//_MainTex乘以之前计算的光照颜色以及纹理采样的两倍 constant的alpha × texture的alpha控制透明度
            }
        }
    }
}
