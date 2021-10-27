//Resume state once done attacking
obj_player.state &= ~PlayerState.RangedAttacking;
update_player_sprite(obj_player);