global.lifes -= 1;
audio_play_sound(snd_lifelost,100,false)
obj_pacman.state = pacmanstates.dead
obj_pacman.sprite_index = spr_pacmandie
