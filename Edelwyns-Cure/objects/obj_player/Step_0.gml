jumpKey = keyboard_check(ord("W")) || keyboard_check(vk_up) || keyboard_check(vk_space);
downKey = keyboard_check(ord("S")) || keyboard_check(vk_down);
leftKey = keyboard_check(ord("A")) || keyboard_check(vk_left);
rightKey = keyboard_check(ord("D")) || keyboard_check(vk_right);
meleeKey = keyboard_check(ord("E")) || keyboard_check(vk_enter);
rangedKey = keyboard_check(ord("F")) || keyboard_check(vk_shift);

//Keep the player inside the screen
x = clamp(x, sprite_xoffset, room_width - sprite_xoffset);
y = clamp(y, sprite_yoffset, room_height - sprite_yoffset);

//Make sure that both right and left keys are not pressed at the same time
move = rightKey - leftKey;

//Horizontal movement
if(move != 0){
	x += move * sprintSpeed;
	image_xscale = 1*move;
}

//Jump
if(jumpKey){
	if(instance_place(x, y+1, obj_block)){
		vspeed = jumpHeight;
	}
}

//Check if player is grounded else apply gravity



/*
//Reaction to state
switch (state) {
    case idle:
        // Do nothing
        break;

    case jump:
        // If we're on a block we can change the state to idle/sprinting depending on control, if jump button is pressed double jump
        break;

    case doubleJump:
        // If we're on a block change to idle/sprinting depending on control
        break;

    case sprint:
        // If keyboard buttons aren't pressed then stop moving, otherwise set vspeed to move speed
        break;

    case meleeAttack:
        // Play melee animation / create weapon obj
        break;

    case rangedAttack:
        // Play ranged attack animation / create weapon and projectile obj
        break;
}
*/
