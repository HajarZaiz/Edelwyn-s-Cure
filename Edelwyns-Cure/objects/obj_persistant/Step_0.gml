//Change cursor on hover
if(position_meeting(mouse_x,mouse_y,obj_startBtn) || position_meeting(mouse_x,mouse_y,obj_menuBtn) || position_meeting(mouse_x,mouse_y,obj_creditsBtn) || position_meeting(mouse_x,mouse_y,obj_controlsBtn) || position_meeting(mouse_x,mouse_y,obj_continueBtn) ){
	window_set_cursor(cr_drag); 
}else{
	window_set_cursor(cr_default); 
}