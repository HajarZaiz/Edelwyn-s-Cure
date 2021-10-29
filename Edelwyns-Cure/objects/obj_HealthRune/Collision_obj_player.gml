if instance_exists(obj_player){
	//Increase Health
	while(lives <= 5){
		lives += 1;
	}
	//Destroy healthrune
	instance_destroy(self)
}