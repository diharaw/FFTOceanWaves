layout(location = 0) in vec3 VS_IN_Position;

// ------------------------------------------------------------------
// OUTPUT VARIABLES  ------------------------------------------------
// ------------------------------------------------------------------

out vec3 FS_IN_WorldPos;

// ------------------------------------------------------------------
// UNIFORMS  --------------------------------------------------------
// ------------------------------------------------------------------

uniform mat4 u_Projection;
uniform mat4 u_View;

// ------------------------------------------------------------------
// MAIN  ------------------------------------------------------------
// ------------------------------------------------------------------

void main()
{
    FS_IN_WorldPos = VS_IN_Position;

    mat4 rotView = mat4(mat3(u_View));
    vec4 clipPos = u_Projection * rotView * vec4(VS_IN_Position, 1.0);

    gl_Position = clipPos.xyww;
}