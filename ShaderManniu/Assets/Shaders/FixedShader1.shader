//固定管线着色器
Shader "Custom/FixedShader1"
{
    Properties
    {
        _Color("Main Color", color) = (1, 1, 1, 1)
        _Ambient("Ambient", color) = (0.3, 0.3, 0.3, 0.3)
        _Specular("Specular", Color) = (1, 1, 1, 1)
        _Shininess("Shininess", Range(0, 8)) = 4
        _Emission("Emission", color) = (1, 1, 1, 1)
    }
    SubShader
    {
        pass{
            // color(1, 1, 1, 1)
            //color[_Color]

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
        }
    }
}
