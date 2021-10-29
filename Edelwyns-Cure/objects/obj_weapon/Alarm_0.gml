//Destroy weapon after a while
if(instance_exists(obj_player)){
	obj_player.state &= ~PlayerState.MeleeAttacking;
	update_player_sprite(obj_player);
}
instance_destroy();

