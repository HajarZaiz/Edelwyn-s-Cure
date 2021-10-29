//Destroy once animation finishes
instance_destroy();
//Restart game or room depending on lives
if(lives <= 0){
	room_goto(GameOverScreen);
}else{
	room_restart();
	room_goto(InfectedPage);
}
