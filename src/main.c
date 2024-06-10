#include "camera.h"
#include "cube.h"
#include "raylib.h"
#include "rlgl.h"

#define GLSL_VERSION 330
//------------------------------------------------------------------------------------
// Program main entry point
//------------------------------------------------------------------------------------
int main(void) {
  // Initialization
  //--------------------------------------------------------------------------------------
  const int screenWidth = 800;
  const int screenHeight = 450;
  SetConfigFlags(FLAG_VSYNC_HINT | FLAG_WINDOW_HIGHDPI);
  InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");

  SetTargetFPS(60); // Set our game to run at 60 frames-per-second
  //--------------------------------------------------------------------------------------

  Camera camera = create_camera();

  Cube_s cube = {
      .texture = LoadTexture("resources/cubicmap_atlas.png"),
      .position = (Vector3){-2.0f, 2.0f, 0.0f},
      .color = WHITE,
      .length = 2.0,
      .width = 2.0,
      .height = 2.0,
  };

  // Main game loop
  while (!WindowShouldClose()) // Detect window close button or ESC key
  {
    // Update
    //----------------------------------------------------------------------------------
    // TODO: Update your variables here
    //----------------------------------------------------------------------------------

    // Draw
    //----------------------------------------------------------------------------------
    BeginDrawing();

    ClearBackground(RAYWHITE);
    BeginMode3D(camera);
    DrawText("Congrats! You created your first window!", 190, 200, 20,
             LIGHTGRAY);
    DrawGrid(10, 1.0f); // Draw a grid
    DrawGlass(cube);
    EndMode3D();
    EndDrawing();
    //----------------------------------------------------------------------------------
  }

  // De-Initialization
  //--------------------------------------------------------------------------------------
  CloseWindow(); // Close window and OpenGL context
  //--------------------------------------------------------------------------------------

  return 0;
}
