# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[type=item_display,tag=aj.reus_aj.root] run return run function animated_java:global/errors/function_not_executed_as_root_entity {'export_namespace': 'reus_aj', 'function_path': 'animated_java:reus_aj/remove/this'}
function #animated_java:reus_aj/as_root/on_remove
execute on passengers if entity @s[tag=aj.data] run function animated_java:reus_aj/remove/zzz/0
execute on passengers run kill @s
kill @s