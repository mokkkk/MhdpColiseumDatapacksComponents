# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.reus_aj.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'reus_aj', 'function_path': 'animated_java:reus_aj/animations/land_dash_start_turn_r/apply_frame'}
$execute store result storage aj:temp frame int 1 run scoreboard players set @s aj.land_dash_start_turn_r.frame $(frame)
execute at @s run function animated_java:reus_aj/animations/land_dash_start_turn_r/zzz/apply_frame with storage aj:temp