instance_destroy(other);
//Orient enemy the other way to get to see the death animation better
image_xscale *= -1;
walk_hspd *= -1;
global.game_over = true;
room_restart()