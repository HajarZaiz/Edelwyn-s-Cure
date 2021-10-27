/// @description Insert description here
// You can write your code in this editor
//Resume idle state once done attacking
obj_player.state &= ~PlayerState.MeleeAttacking;
update_player_sprite(obj_player);
instance_destroy();

