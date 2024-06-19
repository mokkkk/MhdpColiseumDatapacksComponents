scoreboard players add @s aj.ranposu_aj.animation.idle.local_anim_time 1
scoreboard players operation @s aj.anim_time = @s aj.ranposu_aj.animation.idle.local_anim_time
function animated_java:ranposu_aj/zzzzzzzz/animations/idle/apply_frame_as_root
execute if score @s aj.ranposu_aj.animation.idle.local_anim_time matches 60.. run function animated_java:ranposu_aj/zzzzzzzz/animations/idle/end