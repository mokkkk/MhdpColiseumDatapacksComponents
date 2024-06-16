scoreboard players add @s aj.ranposu_aj.animation.damage_flying.local_anim_time 1
scoreboard players operation @s aj.anim_time = @s aj.ranposu_aj.animation.damage_flying.local_anim_time
function animated_java:ranposu_aj/zzzzzzzz/animations/damage_flying/apply_frame_as_root
execute if score @s aj.ranposu_aj.animation.damage_flying.local_anim_time matches 20.. run function animated_java:ranposu_aj/zzzzzzzz/animations/damage_flying/end