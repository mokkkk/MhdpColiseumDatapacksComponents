# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.ranposu_aj.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'ranposu_aj', 'function_path': 'animated_java:ranposu_aj/animations/state_stun/next_frame'}
execute if score @s aj.state_stun.frame matches 36.. run scoreboard players set @s aj.state_stun.frame 1
execute store result storage aj:temp frame int 1 run scoreboard players get @s aj.state_stun.frame
execute at @s run function animated_java:ranposu_aj/animations/state_stun/zzz/apply_frame with storage aj:temp
scoreboard players add @s aj.state_stun.frame 1