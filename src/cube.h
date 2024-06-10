#ifndef _CUBE_H
#define _CUBE_H

#include "raylib.h"
#include "rlgl.h"

typedef struct Cube {
  Texture2D texture;
  Vector3 position;
  float width;
  float height;
  float length;
  Color color;
} Cube_s;

// void DrawCubeTexture(Texture2D texture, Vector3 position, float width,
// float height, float length, Color color);

void DrawGlass(Cube_s cube);

// bool IsColliding(Cube_s cube_a, Cube_s cube_b);

#endif
