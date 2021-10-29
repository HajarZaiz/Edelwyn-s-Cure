/// @description Insert description here
// You can write your code in this editor

// Default state is idle
state = PlayerState.Idle;
tileset = layer_tilemap_get_id(layer_get_id("GroundTiles"));
canFire = true;

// Initial potion states
hasPotion1 = false;
hasPotion2 = false;

// Play background music and level start

audio_play_sound(LevelBeginSound, 10, false);