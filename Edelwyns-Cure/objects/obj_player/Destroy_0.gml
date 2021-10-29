//Player death animation
instance_create_depth(x, y, 100, obj_PlayerDeath);
//Respawn player
lives = lives - 1;
if(lives <= 0){
	room_goto(GameOverPage);
}else{
	room_restart();
}