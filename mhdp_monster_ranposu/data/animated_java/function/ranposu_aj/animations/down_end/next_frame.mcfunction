# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.ranposu_aj.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'ranposu_aj', 'function_path': 'animated_java:ranposu_aj/animations/down_end/next_frame'}
execute if score @s aj.down_end.frame matches 44.. run scoreboard players set @s aj.down_end.frame 1
execute store result storage aj:temp frame int 1 run scoreboard players get @s aj.down_end.frame
execute at @s run function animated_java:ranposu_aj/animations/down_end/zzz/apply_frame with storage aj:temp
scoreboard players add @s aj.down_end.frame 1