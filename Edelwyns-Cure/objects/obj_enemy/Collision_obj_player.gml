
//Orient enemy the other way to get to see the death animation better
image_xscale *= -1;
walk_hspd *= -1;

instance_destroy(self)
score += 10
lives -= 1;
if lives <= 0{
   room_restart()
}