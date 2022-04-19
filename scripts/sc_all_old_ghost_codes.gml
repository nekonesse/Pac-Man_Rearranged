////////// I left this because didnt want to delete someone else's code and if I accidentaly mess something up
//// BLINKY
/// start
    immune = false;
    image_speed = 1;
    ghost_speed = 2;
    direction = 180;
    enum blinkystates
    {
    normal,
    scared,
    eaten
    }
    
    state = blinkystates.normal
    
    //fixing
    global.ghost_speed = 4
/// step
    if instance_exists(obj_pacman)
    {
    
    if obj_music.timerscared > 595
    {
    immune = false
    }
    
    if state == blinkystates.normal
    {
    if global.scared = true && immune = false
    {
    state = blinkystates.scared
    }
    
    ghost_speed = 2;
    new_direction = -1;
    distance_to_pacman = 9999999;
    
    move_wrap(true,true,8)
    
    depth = -y;
    
    //UP
    if direction != 270
    {
        if place_meeting(x,y-2, obj_wall) == false
        {
            var dist = point_distance(x,y+8, obj_pacman.x, obj_pacman.y);
            if dist < distance_to_pacman
            {
                new_direction = 90;
                distance_to_pacman = dist;
                sprite_index = spr_blinkyup
            }
        }
    }
    
    //LEFT
    if direction != 0
    {
        if place_meeting(x-2,y, obj_wall) == false
        {
            var dist = point_distance(x-8,y, obj_pacman.x, obj_pacman.y);
            if dist < distance_to_pacman
            {
                new_direction = 180;
                distance_to_pacman = dist;
                sprite_index = spr_blinkyleft
            }
        }
    }
    
    //RIGHT
    if direction != 180
    {
        if place_meeting(x+2,y, obj_wall) == false
        {
            var dist = point_distance(x+8,y, obj_pacman.x, obj_pacman.y);
            if dist < distance_to_pacman
            {
                new_direction = 0;
                distance_to_pacman = dist;
                sprite_index = spr_blinkyright
            }
        }
    }
    
    //DOWN
    if direction != 90
    {
        if place_meeting(x,y+2, obj_wall) == false
        {
            var dist = point_distance(x,y+8, obj_pacman.x, obj_pacman.y);
            if dist < distance_to_pacman
            {
                new_direction = 270;
                distance_to_pacman = dist;
                sprite_index = spr_blinkydown
            }
        }
    }
    
    if new_direction != -1
    {
    direction = new_direction
    }
    
    move_contact_solid(direction,ghost_speed)
    }
    else if state == blinkystates.scared
    {
    randomize();
    ghost_speed = 1;
    new_direction = -1;
    distance_to_pacman = 9999999;
    
    if global.scared == false
    {
    state = blinkystates.normal
    }
    
    move_wrap(true,true,8)
    
    depth = -y;
    
    var dx = choose(24,80,72,204,152,208,144);
    var dy = choose(274,160,104,40,80,272,216);
    
    if point_distance(x,y, obj_pacman.x,obj_pacman.y) < 64
    {
    dx = choose(24,80,72,204,152,208,144);
    dy = choose(274,160,104,40,80,272,216);
    }
    
    //UP
    if direction != 270
    {
        if place_meeting(x,y-2, obj_wall) == false
        {
            var dist = point_distance(x,y-8, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 90;
                distance_to_pacman = dist;
                sprite_index = spr_scaredghostup
            }
        }
    }
    
    //LEFT
    if direction != 0
    {
        if place_meeting(x-2,y, obj_wall) == false
        {
            var dist = point_distance(x-8,y, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 180;
                distance_to_pacman = dist;
                sprite_index = spr_scaredghostleft
            }
        }
    }
    
    //RIGHT
    if direction != 180
    {
        if place_meeting(x+2,y, obj_wall) == false
        {
            var dist = point_distance(x+8,y, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 0;
                distance_to_pacman = dist;
                sprite_index = spr_scaredghostright
            }
        }
    }
    
    //DOWN
    if direction != 90
    {
        if place_meeting(x,y+2, obj_wall) == false
        {
            var dist = point_distance(x,y+8, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 270;
                distance_to_pacman = dist;
                sprite_index = spr_scaredghostdown
            }
        }
    }
    
    if new_direction != -1
    {
    direction = new_direction
    }
    
    move_contact_solid(direction,ghost_speed)
    }
    else if state == blinkystates.eaten
    {
    ghost_speed = global.ghost_speed
    new_direction = -1;
    distance_to_pacman = 9999999;
    
    move_wrap(true,true,8)
    
    depth = -y;
    
    var dx = obj_ghostspawn.x;
    var dy = obj_ghostspawn.y;
    
    if instance_position(x,y,obj_ghostspawn)
    {
    audio_play_sound(snd_ghostrespawn,498,false)
    immune = true
    state = blinkystates.normal
    }
    
    //UP
    if direction != 270
    {
        if place_meeting(x,y-2, obj_wall) == false
        {
            var dist = point_distance(x,y-8, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 90;
                distance_to_pacman = dist;
                sprite_index = spr_ghosteatenup
            }
        }
    }
    
    //LEFT
    if direction != 0
    {
        if place_meeting(x-2,y, obj_wall) == false
        {
            var dist = point_distance(x-8,y, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 180;
                distance_to_pacman = dist;
                sprite_index = spr_ghosteatenleft
            }
        }
    }
    
    //RIGHT
    if direction != 180
    {
        if place_meeting(x+2,y, obj_wall) == false
        {
            var dist = point_distance(x+8,y, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 0;
                distance_to_pacman = dist;
                sprite_index = spr_ghosteatenright
            }
        }
    }
    
    //DOWN
    if direction != 90
    {
        if place_meeting(x,y+2, obj_wall) == false
        {
            var dist = point_distance(x,y+8, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 270;
                distance_to_pacman = dist;
                sprite_index = spr_ghosteatendown
            }
        }
    }
    
    if new_direction != -1
    {
    direction = new_direction
    }
    
    move_contact_solid(direction,ghost_speed)
    }
    }
// pinky 
// start
    immune = false;
    image_speed = 1;
    ghost_speed = 2;
    direction = 180;
    enum pinkystates
    {
    normal,
    scared,
    eaten
    }
    
    state = pinkystates.normal
// event
    if instance_exists(obj_pacman)
    {
    
    if obj_music.timerscared > 595
    {
    immune = false
    }
    
    if state == pinkystates.normal
    {
    if global.scared = true && immune = false
    {
    state = pinkystates.scared
    }
    ghost_speed = 2;
    new_direction = -1;
    distance_to_pacman = 9999999;
    
    xdirs[0] = +48;
    xdirs[1] = 0//-48;
    xdirs[2] = -48;
    xdirs[3] = 0;
    ydirs[0] = 0;
    ydirs[1] = -48;
    ydirs[2] = 0;
    ydirs[3] = +48;
    
    var dx = xdirs[obj_pacman.direction/90];
    var dy = ydirs[obj_pacman.direction/90];
    
    move_wrap(true,true,8)
    
    depth = -y;
    
    //UP
    if direction != 270
    {
        if place_meeting(x,y-2, obj_wall) == false
        {
            var dist = point_distance(x,y-8, obj_pacman.x+dx, obj_pacman.y+dy);
            if dist < distance_to_pacman
            {
                new_direction = 90;
                distance_to_pacman = dist;
                sprite_index = spr_pinkyup
            }
        }
    }
    
    //LEFT
    if direction != 0
    {
        if place_meeting(x-2,y, obj_wall) == false
        {
            var dist = point_distance(x-8,y, obj_pacman.x+dx, obj_pacman.y+dy);
            if dist < distance_to_pacman
            {
                new_direction = 180;
                distance_to_pacman = dist;
                sprite_index = spr_pinkyleft
            }
        }
    }
    
    //RIGHT
    if direction != 180
    {
        if place_meeting(x+2,y, obj_wall) == false
        {
            var dist = point_distance(x+8,y, obj_pacman.x+dx, obj_pacman.y+dy);
            if dist < distance_to_pacman
            {
                new_direction = 0;
                distance_to_pacman = dist;
                sprite_index = spr_pinkyright
            }
        }
    }
    
    //DOWN
    if direction != 90
    {
        if place_meeting(x,y+2, obj_wall) == false
        {
            var dist = point_distance(x,y+8, obj_pacman.x+dx, obj_pacman.y+dy);
            if dist < distance_to_pacman
            {
                new_direction = 270;
                distance_to_pacman = dist;
                sprite_index = spr_pinkydown
            }
        }
    }
    
    if new_direction != -1
    {
    direction = new_direction
    }
    
    move_contact_solid(direction,ghost_speed)
    }
    else if state == pinkystates.scared
    {
    randomize();
    ghost_speed = 1;
    new_direction = -1;
    distance_to_pacman = 9999999;
    
    if global.scared == false
    {
    state = pinkystates.normal
    }
    
    move_wrap(true,true,8)
    
    depth = -y;
    
    var dx = choose(24,80,72,204,152,208,144);
    var dy = choose(274,160,104,40,80,272,216);
    
    if point_distance(x,y, obj_pacman.x,obj_pacman.y) < 64
    {
    dx = choose(24,80,72,204,152,208,144);
    dy = choose(274,160,104,40,80,272,216);
    }
    
    //UP
    if direction != 270
    {
        if place_meeting(x,y-2, obj_wall) == false
        {
            var dist = point_distance(x,y-8, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 90;
                distance_to_pacman = dist;
                sprite_index = spr_scaredghostup
            }
        }
    }
    
    //LEFT
    if direction != 0
    {
        if place_meeting(x-2,y, obj_wall) == false
        {
            var dist = point_distance(x-8,y, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 180;
                distance_to_pacman = dist;
                sprite_index = spr_scaredghostleft
            }
        }
    }
    
    //RIGHT
    if direction != 180
    {
        if place_meeting(x+2,y, obj_wall) == false
        {
            var dist = point_distance(x+8,y, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 0;
                distance_to_pacman = dist;
                sprite_index = spr_scaredghostright
            }
        }
    }
    
    //DOWN
    if direction != 90
    {
        if place_meeting(x,y+2, obj_wall) == false
        {
            var dist = point_distance(x,y+8, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 270;
                distance_to_pacman = dist;
                sprite_index = spr_scaredghostdown
            }
        }
    }
    
    if new_direction != -1
    {
    direction = new_direction
    }
    
    move_contact_solid(direction,ghost_speed)
    }
    else if state == pinkystates.eaten
    {
    ghost_speed = global.ghost_speed;
    new_direction = -1;
    distance_to_pacman = 9999999;
    
    move_wrap(true,true,8)
    
    depth = -y;
    
    var dx = obj_ghostspawn.x;
    var dy = obj_ghostspawn.y;
    
    if point_distance(x,y, obj_pacman.x,obj_pacman.y) < 64
    {
    dx = obj_ghostspawn.x;
    dy = obj_ghostspawn.y;
    }
    
    if instance_position(x,y,obj_ghostspawn)
    {
    audio_play_sound(snd_ghostrespawn,498,false)
    immune = true
    state = pinkystates.normal
    }
    
    //UP
    if direction != 270
    {
        if place_meeting(x,y-2, obj_wall) == false
        {
            var dist = point_distance(x,y-8, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 90;
                distance_to_pacman = dist;
                sprite_index = spr_ghosteatenup
            }
        }
    }
    
    //LEFT
    if direction != 0
    {
        if place_meeting(x-2,y, obj_wall) == false
        {
            var dist = point_distance(x-8,y, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 180;
                distance_to_pacman = dist;
                sprite_index = spr_ghosteatenleft
            }
        }
    }
    
    //RIGHT
    if direction != 180
    {
        if place_meeting(x+2,y, obj_wall) == false
        {
            var dist = point_distance(x+8,y, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 0;
                distance_to_pacman = dist;
                sprite_index = spr_ghosteatenright
            }
        }
    }
    
    //DOWN
    if direction != 90
    {
        if place_meeting(x,y+2, obj_wall) == false
        {
            var dist = point_distance(x,y+8, dx, dy);
            if dist < distance_to_pacman
            {
                new_direction = 270;
                distance_to_pacman = dist;
                sprite_index = spr_ghosteatendown
            }
        }
    }
    
    if new_direction != -1
    {
    direction = new_direction
    }
    
    move_contact_solid(direction,ghost_speed)
    }
    }
// clyde
// start
immune = false;
image_speed = 1;
ghost_speed = 2;
direction = 180;
enum clydestates
{
normal,
scared,
eaten
}

state = clydestates.normal
// step 
if instance_exists(obj_pacman)
{

if obj_music.timerscared > 595
{
immune = false
}

if state == clydestates.normal
{
if global.scared = true && immune = false
{
state = clydestates.scared
}
ghost_speed = 2
new_direction = -1;
distance_to_pacman = 9999999;

move_wrap(true,true,8)

depth = -y;

var dx = obj_pacman.x;
var dy = obj_pacman.y;

if point_distance(x,y, obj_pacman.x,obj_pacman.y) > 64
{
dx = 0;
dy = room_height;
}

//UP
if direction != 270
{
    if place_meeting(x,y-ghost_speed, obj_wall) == false
    {
        var dist = point_distance(x,y-ghost_speed, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 90;
            distance_to_pacman = dist;
            sprite_index = spr_clydeup
        }
    }
}

//LEFT
if direction != 0
{
    if place_meeting(x-ghost_speed,y, obj_wall) == false
    {
        var dist = point_distance(x-ghost_speed,y, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 180;
            distance_to_pacman = dist;
            sprite_index = spr_clydeleft
        }
    }
}

//RIGHT
if direction != 180
{
    if place_meeting(x+ghost_speed,y, obj_wall) == false
    {
        var dist = point_distance(x+ghost_speed,y, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 0;
            distance_to_pacman = dist;
            sprite_index = spr_clyderight
        }
    }
}

//DOWN
if direction != 90
{
    if place_meeting(x,y+ghost_speed, obj_wall) == false
    {
        var dist = point_distance(x,y+ghost_speed, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 270;
            distance_to_pacman = dist;
            sprite_index = spr_clydedown
        }
    }
}

if new_direction != -1
{
direction = new_direction
}

move_contact_solid(direction,ghost_speed)
}
else if state == clydestates.scared
{
randomize();
ghost_speed = 1;
new_direction = -1;
distance_to_pacman = 9999999;

if global.scared == false
{
state = clydestates.normal
}

move_wrap(true,true,8)

depth = -y;

var dx = choose(24,80,72,204,152,208,144);
var dy = choose(274,160,104,40,80,272,216);

if point_distance(x,y, obj_pacman.x,obj_pacman.y) < 64
{
dx = choose(24,80,72,204,152,208,144);
dy = choose(274,160,104,40,80,272,216);
}

//UP
if direction != 270
{
    if place_meeting(x,y-2, obj_wall) == false
    {
        var dist = point_distance(x,y-8, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 90;
            distance_to_pacman = dist;
            sprite_index = spr_scaredghostup
        }
    }
}

//LEFT
if direction != 0
{
    if place_meeting(x-2,y, obj_wall) == false
    {
        var dist = point_distance(x-8,y, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 180;
            distance_to_pacman = dist;
            sprite_index = spr_scaredghostleft
        }
    }
}

//RIGHT
if direction != 180
{
    if place_meeting(x+2,y, obj_wall) == false
    {
        var dist = point_distance(x+8,y, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 0;
            distance_to_pacman = dist;
            sprite_index = spr_scaredghostright
        }
    }
}

//DOWN
if direction != 90
{
    if place_meeting(x,y+2, obj_wall) == false
    {
        var dist = point_distance(x,y+8, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 270;
            distance_to_pacman = dist;
            sprite_index = spr_scaredghostdown
        }
    }
}

if new_direction != -1
{
direction = new_direction
}

move_contact_solid(direction,ghost_speed)
}
else if state == clydestates.eaten
{
ghost_speed = global.ghost_speed
new_direction = -1;
distance_to_pacman = 9999999;

move_wrap(true,true,8)

depth = -y;

var dx = obj_ghostspawn.x;
var dy = obj_ghostspawn.y;

if instance_position(x,y,obj_ghostspawn)
{
audio_play_sound(snd_ghostrespawn,498,false)
immune = true
state = clydestates.normal
}

//UP
if direction != 270
{
    if place_meeting(x,y-2, obj_wall) == false
    {
        var dist = point_distance(x,y-8, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 90;
            distance_to_pacman = dist;
            sprite_index = spr_ghosteatenup
        }
    }
}

//LEFT
if direction != 0
{
    if place_meeting(x-2,y, obj_wall) == false
    {
        var dist = point_distance(x-8,y, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 180;
            distance_to_pacman = dist;
            sprite_index = spr_ghosteatenleft
        }
    }
}

//RIGHT
if direction != 180
{
    if place_meeting(x+2,y, obj_wall) == false
    {
        var dist = point_distance(x+8,y, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 0;
            distance_to_pacman = dist;
            sprite_index = spr_ghosteatenright
        }
    }
}

//DOWN
if direction != 90
{
    if place_meeting(x,y+2, obj_wall) == false
    {
        var dist = point_distance(x,y+8, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 270;
            distance_to_pacman = dist;
            sprite_index = spr_ghosteatendown
        }
    }
}

if new_direction != -1
{
direction = new_direction
}

move_contact_solid(direction,ghost_speed)
}
}

targetx = dx;
targety = dy;

// funky 
//start
zspeed = 0;
jumpspeed = -8;
grav = 0.6;
z = 0;
zfloor = 0;

immune = false;
image_speed = 1;
ghost_speed = 2;
direction = 180;
enum funkystates
{
normal,
scared,
eaten
}

state = funkystates.normal

// step
    if instance_exists(obj_pacman)
{

if obj_music.timerscared > 595
{
immune = false
}

if state == funkystates.normal
{
if global.scared = true && immune = false
{
state = funkystates.scared
}


move_wrap(true,true,8)

depth = -y;

//UP
if direction != 270
{
    if place_meeting(x,y-2, obj_wall) == false
    {
        var dist = point_distance(x+8,y, obj_pacman.x, obj_pacman.y);
        if dist < distance_to_pacman
        {
            new_direction = 90;
            distance_to_pacman = dist;
            sprite_index = spr_funkyup
        }
    }
}

//LEFT
if direction != 0
{
    if place_meeting(x-2,y, obj_wall) == false
    {
        var dist = point_distance(x+8,y, obj_pacman.x, obj_pacman.y);
        if dist < distance_to_pacman
        {
            new_direction = 180;
            distance_to_pacman = dist;
            sprite_index = spr_funkyleft
        }
    }
}

//RIGHT
if direction != 180
{
    if place_meeting(x+2,y, obj_wall) == false
    {
        var dist = point_distance(x+8,y, obj_pacman.x, obj_pacman.y);
        if dist < distance_to_pacman
        {
            new_direction = 0;
            distance_to_pacman = dist;
            sprite_index = spr_funkyright
        }
    }
}

//DOWN
if direction != 90
{
    if place_meeting(x,y+2, obj_wall) == false
    {
        var dist = point_distance(x+8,y, obj_pacman.x, obj_pacman.y);
        if dist < distance_to_pacman
        {
            new_direction = 270;
            distance_to_pacman = dist;
            sprite_index = spr_funkydown
        }
    }
}

if new_direction != -1
{
direction = new_direction
}

move_contact_solid(direction,ghost_speed)
}
else if state == funkystates.scared
{
randomize();
ghost_speed = 1;
new_direction = -1;
distance_to_pacman = 9999999;

if global.scared == false
{
state = funkystates.normal
}

move_wrap(true,true,8)

depth = -y;

var dx = choose(24,80,72,204,152,208,144);
var dy = choose(274,160,104,40,80,272,216);

if point_distance(x,y, obj_pacman.x, obj_pacman.y) < 64
{
dx = choose(24,80,72,204,152,208,144);
dy = choose(274,160,104,40,80,272,216);
}

//UP
if direction != 270
{
    if place_meeting(x,y-2, obj_wall) == false
    {
        var dist = point_distance(x,y-8, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 90;
            distance_to_pacman = dist;
            sprite_index = spr_scaredghostup
        }
    }
}

//LEFT
if direction != 0
{
    if place_meeting(x-2,y, obj_wall) == false
    {
        var dist = point_distance(x-8,y, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 180;
            distance_to_pacman = dist;
            sprite_index = spr_scaredghostleft
        }
    }
}

//RIGHT
if direction != 180
{
    if place_meeting(x+2,y, obj_wall) == false
    {
        var dist = point_distance(x+8,y, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 0;
            distance_to_pacman = dist;
            sprite_index = spr_scaredghostright
        }
    }
}

//DOWN
if direction != 90
{
    if place_meeting(x,y+2, obj_wall) == false
    {
        var dist = point_distance(x,y+8, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 270;
            distance_to_pacman = dist;
            sprite_index = spr_scaredghostdown
        }
    }
}

if new_direction != -1
{
direction = new_direction
}

move_contact_solid(direction,ghost_speed)
}
else if state == funkystates.eaten
{
ghost_speed = global.ghost_speed;
new_direction = -1;
distance_to_pacman = 9999999;

move_wrap(true,true,8)

depth = -y;

var dx = obj_ghostspawn.x;
var dy = obj_ghostspawn.y;

if instance_position(x,y,obj_ghostspawn)
{
audio_play_sound(snd_ghostrespawn,498,false)
immune = true
state = funkystates.normal
}

//UP
if direction != 270
{
    if place_meeting(x,y-2, obj_wall) == false
    {
        var dist = point_distance(x,y-8, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 90;
            distance_to_pacman = dist;
            sprite_index = spr_ghosteatenup
        }
    }
}

//LEFT
if direction != 0
{
    if place_meeting(x-2,y, obj_wall) == false
    {
        var dist = point_distance(x-8,y, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 180;
            distance_to_pacman = dist;
            sprite_index = spr_ghosteatenleft
        }
    }
}

//RIGHT
if direction != 180
{
    if place_meeting(x+2,y, obj_wall) == false
    {
        var dist = point_distance(x+8,y, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 0;
            distance_to_pacman = dist;
            sprite_index = spr_ghosteatenright
        }
    }
}

//DOWN
if direction != 90
{
    if place_meeting(x,y+2, obj_wall) == false
    {
        var dist = point_distance(x,y+8, dx, dy);
        if dist < distance_to_pacman
        {
            new_direction = 270;
            distance_to_pacman = dist;
            sprite_index = spr_ghosteatendown
        }
    }
}

if new_direction != -1
{
direction = new_direction
}

move_contact_solid(direction,ghost_speed)
}
}
///////// other

