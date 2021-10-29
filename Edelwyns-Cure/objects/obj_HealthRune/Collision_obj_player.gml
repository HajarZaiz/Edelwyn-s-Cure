if instance_exists(obj_player){
	//Increase Health
	if(lives <= 5){
		lives += 1;
	}
	//Destroy healthrune
	instance_destroy(self)
}