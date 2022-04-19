/// player_die()
global.lifes -= 1;
obj_pacman.sprite_index = spr_pacmandie
audio_play_sound(snd_lifelost,100,false)
obj_pacman.state = pacmanstates.dead
exit;
