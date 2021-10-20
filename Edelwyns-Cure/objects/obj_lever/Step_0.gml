/// @description Insert description here
// You can write your code in this editor
//LEVER STEP EVENT
if place_meeting(x, y, PlayerObject) && ready
{
    ready = false;
	//substitute obj_Chest with any preferred object that requires a lever
    with (instance_nearest(x, y, obj_Chest)) {chest_open = !chest_open;}
}

//THIS CONTROLS HOW OFTEN YOU CAN SWITCH THE LEVER ON AND OFF
if !ready
{
    if ready_alarm < 20 {ready_alarm += 1;}
    else
    {
        ready_alarm = 0;
        ready = true;
    }
}
	