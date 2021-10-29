//Draw health bar with varying sub-image
draw_sprite(HealthSprite, lives ,200,100);
//Draw score
draw_set_halign(fa_left);
draw_set_font(fn_score);
draw_set_color(make_color_rgb(195, 219, 217));
draw_text(100, 150, "Score: " + string(score));

//Draw pause menu
if(paused){
	draw_sprite(PauseBtnSprite, 0, 960, 540);
	draw_set_halign(fa_middle);
	draw_text(960, 700, "Press P to Resume");
}