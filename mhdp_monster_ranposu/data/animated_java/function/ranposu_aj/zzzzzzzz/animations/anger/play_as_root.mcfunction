scoreboard players set @s aj.anim_time 0
scoreboard players set @s aj.ranposu_aj.animation.anger.local_anim_time 0
scoreboard players set @s aj.ranposu_aj.animation.anger.loop_mode 2
execute on passengers run data modify entity @s interpolation_duration set value 0
function animated_java:ranposu_aj/zzzzzzzz/animations/anger/tree/leaf_0
execute on passengers run data modify entity @s interpolation_duration set value 1
tag @s add aj.ranposu_aj.animation.anger