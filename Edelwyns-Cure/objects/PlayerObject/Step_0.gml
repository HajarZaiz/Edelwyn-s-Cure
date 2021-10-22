/// @description Insert description here
// You can write your code in this editor

// --------------- Physics variables ---------------
acceleration_x = 0;
acceleration_y = 0;
delta = delta_time / 1000000 * 64; // Multiply by 64 for tile size

// --------------- Inputs ---------------
jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) ||
    keyboard_check_pressed(vk_space);
left = keyboard_check(ord("A")) || keyboard_check(vk_left);
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
melee = keyboard_check(ord("E")) || keyboard_check(vk_enter);
ranged = keyboard_check(ord("F")) || keyboard_check(vk_shift);

// --------------- Change state depending on inputs ---------------

// Horizontal Movement
if (left || right) {
    state |= PlayerState.Sprinting;
    
    if (left) acceleration_x = -acceleration_rate;
    if (right) acceleration_x = acceleration_rate;
    
    update_player_sprite(self);
}

// Jumping
if (jump && state & PlayerState.Jumping == 0 &&
    state & PlayerState.DoubleJumping == 0) {
    
    state |= PlayerState.Jumping;
    
    vspeed -= jump_height * delta;
}

// Double Jumping
if (jump && state & PlayerState.Jumping &&
    state & PlayerState.DoubleJumping == 0) {
    
    // Remove jumping state and add double jumping state
    state &= ~PlayerState.Jumping;
    state |= PlayerState.DoubleJumping;
    
    vspeed -= jump_height * delta;
}

// --------------- Actions depending on state ---------------

// Sprinting State Ending
if (state & PlayerState.Sprinting && acceleration_x == 0 && hspeed == 0) {
    // Remove the sprinting state from the player 
    state &= ~PlayerState.Sprinting;
    acceleration_x = 0;
    update_player_sprite(self);
}

// --------------- Collision Detection ---------------

// Vertical Below Collisions
blockBelow = tilemap_get_at_pixel(tileset, x, y + sprite_height/2 - 32) & tile_index_mask;
if (blockBelow && (acceleration_y > 0 || vspeed > 0)) {
    
    if (acceleration_y > 0) acceleration_y = 0;
    if (vspeed > 0) vspeed = 0;
    state &= ~PlayerState.Jumping & ~PlayerState.DoubleJumping;
    update_player_sprite(self);
}
else if (!blockBelow) {
    acceleration_y += gravity_rate;
}

// Vertical Above Collisions
if (tilemap_get_at_pixel(tileset, x - sprite_width/2, y - sprite_height/2) & tile_index_mask ||
    tilemap_get_at_pixel(tileset, x + sprite_width/2, y - sprite_height/2) & tile_index_mask) {
    if (acceleration_y < 0) acceleration_y = 0;
    if (vspeed < 0) vspeed = 0;
}

// Left Horizontal Collisions
if (tilemap_get_at_pixel(tileset, x - 10, y) & tile_index_mask) {
    
    if (acceleration_x < 0) acceleration_x = 0;
    if (hspeed < 0) hspeed = 0;
}

// Right Horizontal Collisions
if (tilemap_get_at_pixel(tileset, x + 10, y) & tile_index_mask) {
    
    // Stop Sprinting
    if (acceleration_x > 0) acceleration_x = 0;
    if (hspeed > 0) hspeed = 0;
}

// --------------- Custom Physics Implementation ---------------

hspeed += acceleration_x * delta;
vspeed += acceleration_y * delta;

hspeed -= sign(hspeed) * deceleration_rate * delta;
if (abs(hspeed) < 1) hspeed = 0;

if (hspeed > 0) image_xscale = 1;
if (hspeed < 0) image_xscale = -1;

vspeed = clamp(vspeed, -jump_height, jump_height);
hspeed = clamp(hspeed, -max_speed * delta, max_speed * delta);
x = clamp(x, sprite_width/2, room_width - sprite_width/2);

// --------------- Life Loss ---------------

if (y > room_height - sprite_height/2) {
    room_restart();
}