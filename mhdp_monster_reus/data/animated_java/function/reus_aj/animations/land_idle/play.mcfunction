# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.reus_aj.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'reus_aj', 'function_path': 'animated_java:reus_aj/animations/land_idle/play'}
tag @s add aj.reus_aj.animation.land_idle.playing
scoreboard players set @s aj.land_idle.frame 0
tag @s add aj.transforms_only
execute at @s run function animated_java:reus_aj/animations/land_idle/zzz/set_frame {frame: 0}
tag @s remove aj.transforms_only