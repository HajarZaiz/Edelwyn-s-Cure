//Attack player when within vision range
if(instance_exists(obj_player)){
	if(distance_to_object(obj_player) < visionRange){
		direction = point_direction(x,y,obj_player.x, y);
		if(obj_player.x != x){
			image_xscale = sign(x - obj_player.x);
			hspeed = sign(x - obj_player.x)*chase_hspd;
		}
	}
	else{
		//Check if the enemy is oriented correctly before resuming movement
		if((sign(walk_hspd)- sign(image_xscale)) != 0){
			hspeed = walk_hspd;
		}else{
			walk_hspd *= -1;
			hspeed = walk_hspd;
		}
	}
}else{
	//Check if the enemy is oriented correctly before resuming movement
	if((sign(walk_hspd)- sign(image_xscale)) != 0){
		hspeed = walk_hspd;
	}else{
		walk_hspd *= -1;
		hspeed = walk_hspd;
	}
}

