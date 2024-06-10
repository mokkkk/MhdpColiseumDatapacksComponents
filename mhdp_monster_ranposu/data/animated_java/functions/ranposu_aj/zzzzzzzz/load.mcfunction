scoreboard objectives add aj.i dummy
scoreboard objectives add aj.id dummy
scoreboard objectives add aj.tween_time dummy
scoreboard objectives add aj.anim_time dummy
scoreboard objectives add aj.life_time dummy
scoreboard objectives add aj.ranposu_aj.export_version dummy
scoreboard objectives add aj.ranposu_aj.rig_loaded dummy
scoreboard objectives add aj.ranposu_aj.animation.idle.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.voice.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.anger.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.turn_right.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.turn_left.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.step_back.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.move.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.bite.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.claw.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.tail_right.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.tail_left.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.move_claw.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.jump.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.tackle.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.step_jump_right.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.step_jump_left.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.damage.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.damage_down.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.down.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.down_end.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.damage_flying.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.death.local_anim_time dummy
scoreboard objectives add aj.ranposu_aj.animation.idle.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.voice.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.anger.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.turn_right.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.turn_left.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.step_back.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.move.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.bite.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.claw.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.tail_right.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.tail_left.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.move_claw.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.jump.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.tackle.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.step_jump_right.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.step_jump_left.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.damage.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.damage_down.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.down.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.down_end.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.damage_flying.loop_mode dummy
scoreboard objectives add aj.ranposu_aj.animation.death.loop_mode dummy
scoreboard players set $aj.ranposu_aj.animation.idle aj.id 0
scoreboard players set $aj.ranposu_aj.animation.voice aj.id 1
scoreboard players set $aj.ranposu_aj.animation.anger aj.id 2
scoreboard players set $aj.ranposu_aj.animation.turn_right aj.id 3
scoreboard players set $aj.ranposu_aj.animation.turn_left aj.id 4
scoreboard players set $aj.ranposu_aj.animation.step_back aj.id 5
scoreboard players set $aj.ranposu_aj.animation.move aj.id 6
scoreboard players set $aj.ranposu_aj.animation.bite aj.id 7
scoreboard players set $aj.ranposu_aj.animation.claw aj.id 8
scoreboard players set $aj.ranposu_aj.animation.tail_right aj.id 9
scoreboard players set $aj.ranposu_aj.animation.tail_left aj.id 10
scoreboard players set $aj.ranposu_aj.animation.move_claw aj.id 11
scoreboard players set $aj.ranposu_aj.animation.jump aj.id 12
scoreboard players set $aj.ranposu_aj.animation.tackle aj.id 13
scoreboard players set $aj.ranposu_aj.animation.step_jump_right aj.id 14
scoreboard players set $aj.ranposu_aj.animation.step_jump_left aj.id 15
scoreboard players set $aj.ranposu_aj.animation.damage aj.id 16
scoreboard players set $aj.ranposu_aj.animation.damage_down aj.id 17
scoreboard players set $aj.ranposu_aj.animation.down aj.id 18
scoreboard players set $aj.ranposu_aj.animation.down_end aj.id 19
scoreboard players set $aj.ranposu_aj.animation.damage_flying aj.id 20
scoreboard players set $aj.ranposu_aj.animation.death aj.id 21
scoreboard players set $aj.ranposu_aj.variant.default aj.id 0
scoreboard players add .aj.last_id aj.id 0
scoreboard players set $aj.loop_mode.loop aj.i 0
scoreboard players set $aj.loop_mode.once aj.i 1
scoreboard players set $aj.loop_mode.hold aj.i 2
scoreboard players set aj.ranposu_aj.export_version aj.i -895888941
scoreboard players reset * aj.ranposu_aj.rig_loaded
execute as @e[type=minecraft:item_display,tag=aj.ranposu_aj.root] run function animated_java:ranposu_aj/zzzzzzzz/on_load