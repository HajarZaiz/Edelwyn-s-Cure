/// @description Insert description here
// You can write your code in this editor
global.game_over = false;
draw_set_colour($FFBFFBFF)


/*TODO Write Lives code here */
for( var i = 0; i < lives; i++){
	draw_sprite(spr_life,0,(50+24 * i),fa_left+30)
}


draw_set_halign(fa_left)
draw_text(55, 55, "Score: " + string(score))



if (global.game_over) {
	draw_set_halign(fa_center)
	draw_text(room_width / 2, room_height / 2, "Game Over! Press R to restart.")
}