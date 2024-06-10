scoreboard players set @s aj.ranposu_aj.animation.idle.local_anim_time 0
tag @s remove aj.ranposu_aj.animation.idle
execute on passengers run data modify entity @s interpolation_duration set value 0
tag @s add aj.ranposu_aj.disable_command_keyframes
function animated_java:ranposu_aj/zzzzzzzz/animations/idle/tree/leaf_0
tag @s remove aj.ranposu_aj.disable_command_keyframes