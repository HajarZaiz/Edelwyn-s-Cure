//Check if player is almost under spikes
if(instance_exists(obj_player)){
	if(x-obj_player.x < satisfactionDistance){
		//Drop spikes
		vspeed = vspd;
		//On collision with platform stop
		blockBelow = tilemap_get_at_pixel(tileset, x, y + sprite_height/2 - 50) & tile_index_mask;
		if(blockBelow){
			vspeed = 0;
			//Destroy or disable collision
			instance_destroy();
		}
	}
}