execute if score @s aj.ranposu_aj.animation.damage_down.loop_mode = $aj.loop_mode.loop aj.i run function animated_java:ranposu_aj/zzzzzzzz/animations/damage_down/end_loop
execute if score @s aj.ranposu_aj.animation.damage_down.loop_mode = $aj.loop_mode.once aj.i run function animated_java:ranposu_aj/animations/damage_down/stop
execute if score @s aj.ranposu_aj.animation.damage_down.loop_mode = $aj.loop_mode.hold aj.i run function animated_java:ranposu_aj/animations/damage_down/pause