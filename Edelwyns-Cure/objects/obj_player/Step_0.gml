jump = keyboard_check(ord("W")) || keyboard_check(vk_up) || keyboard_check(vk_space);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);
left = keyboard_check(ord("A")) || keyboard_check(vk_left);
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
melee = keyboard_check(ord("E")) || keyboard_check(vk_enter);
ranged = keyboard_check(ord("F")) || keyboard_check(vk_shift);

switch (state) {
    case idle:
        // Do nothing
        break;

    case jumping:
        // If we're on a block we can change the state to idle/sprinting depending on control, if jump button is pressed double jump
        break;

    case doubleJump:
        // If we're on a block change to idle/sprinting depending on control
        break;

    case sprinting:
        // If keyboard buttons aren't pressed then stop moving, otherwise set vspeed to move speed
        break;

    case meleeAttack:
        // Play melee animation / create weapon obj
        break;

    case rangedAttack:
        // Play ranged attack animation / create weapon and projectile obj
        break;
}