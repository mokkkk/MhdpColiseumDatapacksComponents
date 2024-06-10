execute unless score #frame aj.i = #frame aj.i run scoreboard players set #frame aj.i 0
execute unless score #variant aj.i = #variant aj.i run scoreboard players set #variant aj.i 0
execute unless score #animation aj.i = #animation aj.i run scoreboard players set #animation aj.i -1
scoreboard players set @s aj.anim_time 0
scoreboard players set @s aj.ranposu_aj.rig_loaded 1
scoreboard players operation @s aj.ranposu_aj.export_version = aj.ranposu_aj.export_version aj.i
execute store result score @s aj.id run scoreboard players add .aj.last_id aj.id 1
tp @s ~ ~ ~ ~ ~
execute at @s on passengers run function animated_java:ranposu_aj/zzzzzzzz/summon/as_rig_entities
execute if score #variant aj.i = $aj.ranposu_aj.variant.default aj.id run function animated_java:ranposu_aj/zzzzzzzz/apply_variant/default/as_root
execute if score #animation aj.i matches 0.. run scoreboard players operation @s aj.anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.idle aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/idle/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.idle aj.id run scoreboard players operation @s aj.ranposu_aj.animation.idle.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.voice aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/voice/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.voice aj.id run scoreboard players operation @s aj.ranposu_aj.animation.voice.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.anger aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/anger/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.anger aj.id run scoreboard players operation @s aj.ranposu_aj.animation.anger.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.turn_right aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/turn_right/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.turn_right aj.id run scoreboard players operation @s aj.ranposu_aj.animation.turn_right.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.turn_left aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/turn_left/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.turn_left aj.id run scoreboard players operation @s aj.ranposu_aj.animation.turn_left.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.step_back aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/step_back/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.step_back aj.id run scoreboard players operation @s aj.ranposu_aj.animation.step_back.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.move aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/move/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.move aj.id run scoreboard players operation @s aj.ranposu_aj.animation.move.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.bite aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/bite/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.bite aj.id run scoreboard players operation @s aj.ranposu_aj.animation.bite.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.claw aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/claw/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.claw aj.id run scoreboard players operation @s aj.ranposu_aj.animation.claw.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.tail_right aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/tail_right/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.tail_right aj.id run scoreboard players operation @s aj.ranposu_aj.animation.tail_right.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.tail_left aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/tail_left/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.tail_left aj.id run scoreboard players operation @s aj.ranposu_aj.animation.tail_left.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.move_claw aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/move_claw/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.move_claw aj.id run scoreboard players operation @s aj.ranposu_aj.animation.move_claw.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.jump aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/jump/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.jump aj.id run scoreboard players operation @s aj.ranposu_aj.animation.jump.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.tackle aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/tackle/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.tackle aj.id run scoreboard players operation @s aj.ranposu_aj.animation.tackle.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.step_jump_right aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/step_jump_right/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.step_jump_right aj.id run scoreboard players operation @s aj.ranposu_aj.animation.step_jump_right.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.step_jump_left aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/step_jump_left/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.step_jump_left aj.id run scoreboard players operation @s aj.ranposu_aj.animation.step_jump_left.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.damage aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/damage/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.damage aj.id run scoreboard players operation @s aj.ranposu_aj.animation.damage.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.damage_down aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/damage_down/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.damage_down aj.id run scoreboard players operation @s aj.ranposu_aj.animation.damage_down.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.down aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/down/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.down aj.id run scoreboard players operation @s aj.ranposu_aj.animation.down.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.down_end aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/down_end/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.down_end aj.id run scoreboard players operation @s aj.ranposu_aj.animation.down_end.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.damage_flying aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/damage_flying/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.damage_flying aj.id run scoreboard players operation @s aj.ranposu_aj.animation.damage_flying.local_anim_time = #frame aj.i
execute if score #animation aj.i = $aj.ranposu_aj.animation.death aj.id run function animated_java:ranposu_aj/zzzzzzzz/animations/death/apply_frame_as_root
execute if score #animation aj.i = $aj.ranposu_aj.animation.death aj.id run scoreboard players operation @s aj.ranposu_aj.animation.death.local_anim_time = #frame aj.i
execute at @s run function #animated_java:ranposu_aj/on_summon/as_root
tag @s remove aj.new
scoreboard players reset #frame aj.i
scoreboard players reset #variant aj.i
scoreboard players reset #animation aj.i