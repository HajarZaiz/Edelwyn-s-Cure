//Pause game
if( keyboard_check_pressed(ord("P"))){
    paused = !paused;
}

if(paused){
	instance_deactivate_all(1);
}else{
	instance_activate_all();
}
