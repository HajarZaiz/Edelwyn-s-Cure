//Orient enemy the other way to get to see the death animation better
image_xscale *= -1;
walk_hspd *= -1;

//Don't destroy player mid air
if(abs(y-obj_player.y) < 10){
	instance_destroy(other);
}
