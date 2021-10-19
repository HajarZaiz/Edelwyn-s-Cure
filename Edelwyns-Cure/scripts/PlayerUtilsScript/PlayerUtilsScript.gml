// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// The order of the states goes from least to greatest 
// Double Jumping sprite takes priority over Sprinting, etc
enum PlayerState {
	Idle = 1 << 1,
	MeleeAttacking = 1 << 2,
	RangedAttacking = 1 << 3,
	Sprinting = 1 << 4,
	Jumping = 1 << 5,
	DoubleJumping = 1 << 6
};

// Updates the player's sprite index based on its state
function update_player_sprite(player) {
	// 6 total player states
	numPlayerStates = 6;
	highestPlayerState = PlayerState.Idle;
	
	// Get the highest state from the player
	for (i = numPlayerStates; i > 0; i--) {
		if (player.state < 1 << i) continue;
		highestPlayerState = 1 << i;
		break;
	}
	
	// Now set the player sprite based on the highest player state
	switch (highestPlayerState) {
		case PlayerState.Idle:
			player.sprite_index = CharacterIdleSprite;
			return;
		case PlayerState.MeleeAttacking:
			// TODO - Set Melee Attacking Sprite
			return;
		case PlayerState.RangedAttacking:
			// TODO - Set Ranged Attacking Sprite
			return;
		case PlayerState.Sprinting:
			player.sprite_index = CharacterRunSprite;
			return;
		case PlayerState.Jumping: case PlayerState.DoubleJumping:
			// TODO - Set Jumping Sprite
			return;
	}
}