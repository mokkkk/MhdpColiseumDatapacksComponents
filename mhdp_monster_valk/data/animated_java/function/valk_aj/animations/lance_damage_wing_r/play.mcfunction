# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.valk_aj.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'valk_aj', 'function_path': 'animated_java:valk_aj/animations/lance_damage_wing_r/play'}
tag @s add aj.valk_aj.animation.lance_damage_wing_r.playing
scoreboard players set @s aj.lance_damage_wing_r.frame 0
tag @s add aj.transforms_only
execute at @s run function animated_java:valk_aj/animations/lance_damage_wing_r/zzz/set_frame {frame: 0}
tag @s remove aj.transforms_only