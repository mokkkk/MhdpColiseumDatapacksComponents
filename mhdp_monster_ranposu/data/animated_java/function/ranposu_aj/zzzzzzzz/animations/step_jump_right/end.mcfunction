execute if score @s aj.ranposu_aj.animation.step_jump_right.loop_mode = $aj.loop_mode.loop aj.i run function animated_java:ranposu_aj/zzzzzzzz/animations/step_jump_right/end_loop
execute if score @s aj.ranposu_aj.animation.step_jump_right.loop_mode = $aj.loop_mode.once aj.i run function animated_java:ranposu_aj/animations/step_jump_right/stop
execute if score @s aj.ranposu_aj.animation.step_jump_right.loop_mode = $aj.loop_mode.hold aj.i run function animated_java:ranposu_aj/animations/step_jump_right/pause