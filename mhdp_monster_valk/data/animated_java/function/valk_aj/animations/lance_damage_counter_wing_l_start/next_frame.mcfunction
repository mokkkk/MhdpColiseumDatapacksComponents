# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.valk_aj.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'valk_aj', 'function_path': 'animated_java:valk_aj/animations/lance_damage_counter_wing_l_start/next_frame'}
execute if score @s aj.lance_damage_counter_wing_l_start.frame matches 39.. run scoreboard players set @s aj.lance_damage_counter_wing_l_start.frame 1
execute store result storage aj:temp frame int 1 run scoreboard players get @s aj.lance_damage_counter_wing_l_start.frame
execute at @s run function animated_java:valk_aj/animations/lance_damage_counter_wing_l_start/zzz/apply_frame with storage aj:temp
scoreboard players add @s aj.lance_damage_counter_wing_l_start.frame 1