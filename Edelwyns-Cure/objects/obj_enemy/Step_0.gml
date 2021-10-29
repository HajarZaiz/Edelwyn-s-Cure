//Attack player when within vision range and on the same platform
if(instance_exists(obj_player)){
	if(distance_to_object(obj_player) < visionRange && (obj_player.y - y) < radiusOfSatisfaction && chasingAllowed){
		chasing = true;
		direction = point_direction(x,y,obj_player.x, y);
		//Change sprite
		sprite_index = EnemyChaseSprite;
		if(obj_player.x != x){
			image_xscale = sign(x - obj_player.x);
			hspeed = sign(x - obj_player.x)*chase_hspd;
		}
	}
	else{
		//Change sprite
		sprite_index = EnemyRunSprite;
		//Check if the enemy is oriented correctly before resuming movement
		if((sign(walk_hspd)- sign(image_xscale)) != 0){
			hspeed = walk_hspd;
		}else{
			walk_hspd *= -1;
			hspeed = walk_hspd;
		}
	}
}

//Stop chasing beyond the platform
if(chasing && place_meeting(x, y, obj_stop)){
	chasingAllowed = false;
	chasing = false;
}else{
	chasingAllowed = true;
}

//Resume movement (prevents glitching after collision with stop)
if(!chasing){
	//Change sprite
	sprite_index = EnemyRunSprite;
	//Check if the enemy is oriented correctly before resuming movement
	if((sign(walk_hspd)- sign(image_xscale)) != 0){
		hspeed = walk_hspd;
	}else{
		walk_hspd *= -1;
		hspeed = walk_hspd;
	}
}

