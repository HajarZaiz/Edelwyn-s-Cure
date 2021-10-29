//Restart the room
if( keyboard_check_pressed(ord("R"))){
	room_restart();
//Restart the game
}else if( keyboard_check_pressed(ord("G"))){
	game_restart();
//Collect both potions
}else if( keyboard_check_pressed(ord("Z"))){
	if(instance_exists(obj_player)){
		obj_player.hasPotion1 = true;
		if(instance_exists(obj_potion1)){
			instance_destroy(obj_potion1);
		}
		obj_player.hasPotion2 = true;
		if(instance_exists(obj_potion2)){
			instance_destroy(obj_potion2);
		}
	}
//Increase the score by 10
}else if(keyboard_check_pressed(ord("S"))){
	score = score + 10;
}
