# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.reus_aj.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'reus_aj', 'function_path': 'animated_java:reus_aj/animations/land_dash/next_frame'}
execute if score @s aj.land_dash.frame matches 23.. run scoreboard players set @s aj.land_dash.frame 1
execute store result storage aj:temp frame int 1 run scoreboard players get @s aj.land_dash.frame
execute at @s run function animated_java:reus_aj/animations/land_dash/zzz/apply_frame with storage aj:temp
scoreboard players add @s aj.land_dash.frame 1