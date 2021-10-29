//Pause game
if( keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_escape)){
    paused = !paused;
}

if(paused){
	instance_deactivate_all(1);
}else{
	instance_activate_all();
}

//Go to win screen
if(instance_exists(obj_player)){
	if(obj_player.hasPotion1 && obj_player.hasPotion2){
		room_goto(WinScreen);
		instance_destroy();
	}
}