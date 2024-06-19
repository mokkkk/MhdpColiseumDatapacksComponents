scoreboard players add @s aj.ranposu_aj.animation.step_jump_left.local_anim_time 1
scoreboard players operation @s aj.anim_time = @s aj.ranposu_aj.animation.step_jump_left.local_anim_time
function animated_java:ranposu_aj/zzzzzzzz/animations/step_jump_left/apply_frame_as_root
execute if score @s aj.ranposu_aj.animation.step_jump_left.local_anim_time matches 100.. run function animated_java:ranposu_aj/zzzzzzzz/animations/step_jump_left/end