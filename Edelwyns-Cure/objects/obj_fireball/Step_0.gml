//Destroy once out of view
if( x < camera_get_view_x(view_camera[0]) || x > camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])){
    instance_destroy();
}