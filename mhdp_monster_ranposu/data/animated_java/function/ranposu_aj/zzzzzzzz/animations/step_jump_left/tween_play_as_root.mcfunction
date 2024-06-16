function animated_java:ranposu_aj/zzzzzzzz/animations/step_jump_left/play_as_root
function animated_java:ranposu_aj/zzzzzzzz/animations/step_jump_left/tween_as_root
execute if score #tween_duration aj.i matches ..0 on passengers run data modify entity @s interpolation_duration set value 1
scoreboard players reset #tween_duration aj.i