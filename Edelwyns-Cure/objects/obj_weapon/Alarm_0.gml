//Destroy weapon after a while

obj_player.state &= ~PlayerState.MeleeAttacking;
update_player_sprite(obj_player);
instance_destroy();

