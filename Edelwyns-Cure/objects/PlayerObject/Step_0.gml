/// @description Insert description here
// You can write your code in this editor

// --------------- Physics variables ---------------
acceleration_x = 0;
acceleration_y = 0;
delta = delta_time / 1000000 * 64; // Multiply by 64 for tile size

// --------------- Inputs ---------------
jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space);
jumpDirection = point_direction(x, y, mouse_x, mouse_y);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);
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
	
	hspeed += dcos(jumpDirection) * jump_height * delta;
	vspeed -= dsin(jumpDirection) * jump_height * delta;
}

// --------------- Actions depending on state ---------------

// Idle State
if (state & PlayerState.Idle) {
    // Do nothing
}

// Jumping State
if (state & PlayerState.Jumping) {
    // If we're on a block we can change the state to idle/sprinting depending on control, if jump button is pressed double jump
}

// Double Jumping State
if (state & PlayerState.DoubleJumping) {
    // If we're on a block change to idle/sprinting depending on control
}

// Sprinting State Ending
if (state & PlayerState.Sprinting && acceleration_x == 0 && hspeed == 0) {
    // Remove the sprinting state from the player 
	state &= ~PlayerState.Sprinting;
	acceleration_x = 0;
	update_player_sprite(self);
} 

// Meleee Attacking State
if (state & PlayerState.MeleeAttacking) {
    // Play melee animation / create weapon obj
}

// Ranged Attacking State
if (state & PlayerState.RangedAttacking) {
    // Play ranged attack animation / create weapon and projectile obj
}

// --------------- Collision Detection ---------------

// Vertical Below Collisions
if (tilemap_get_at_pixel(tileset, x - sprite_width/2, y + sprite_height/2 - 32) & tile_index_mask ||
	tilemap_get_at_pixel(tileset, x + sprite_width/2, y + sprite_height/2 - 32) & tile_index_mask) {
	
	if (acceleration_y > 0) acceleration_y = 0;
	if (vspeed > 0) vspeed = 0;
	state &= ~PlayerState.Jumping;
}
else {
	acceleration_y += gravity_rate;
}

// Vertical Above Collisions
if (tilemap_get_at_pixel(tileset, x - sprite_width/2, y - sprite_height/2) & tile_index_mask ||
	tilemap_get_at_pixel(tileset, x + sprite_width/2, y - sprite_height/2) & tile_index_mask) {
	if (acceleration_y < 0) acceleration_y = 0;
	if (vspeed < 0) vspeed = 0;
}

// Left Horizontal Collisions
if (tilemap_get_at_pixel(tileset, x - sprite_width/2, y - sprite_height/2) & tile_index_mask ||
	tilemap_get_at_pixel(tileset, x - sprite_width/2, y + sprite_height/2 - 48) & tile_index_mask) {
	
	if (acceleration_x < 0) acceleration_x = 0;
	if (hspeed < 0) hspeed = 0;
}

// Right Horizontal Collisions
if (tilemap_get_at_pixel(tileset, x + sprite_width/2, y - sprite_height/2) & tile_index_mask ||
	tilemap_get_at_pixel(tileset, x + sprite_width/2, y + sprite_height/2 - 48) & tile_index_mask) {
	
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

hspeed = clamp(hspeed, -max_speed * delta, max_speed * delta);
x = clamp(x, sprite_width/2, room_width - sprite_width/2);

// --------------- Life Loss ---------------

if (y - sprite_height/2 > room_height) {
	// Player fell out of room - kill player
}