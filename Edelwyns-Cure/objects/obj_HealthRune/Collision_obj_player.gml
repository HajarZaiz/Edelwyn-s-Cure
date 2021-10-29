if instance_exists(obj_player){
	//Increase Health
	if(lives < 5){
		lives += 1;
	}
	audio_play_sound(PlayerCollectibleSound, 10, false);
	//Destroy healthrune
	instance_destroy(self)
}