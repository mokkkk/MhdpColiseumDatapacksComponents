# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
tag @s remove aj.new
function animated_java:global/internal/gu/convert_uuid_array_to_string with entity @s
execute as @e[type=item_display,tag=aj.new,limit=1,distance=..0.01] on passengers if entity @s[tag=aj.data] run function animated_java:ranposu_aj/zzz/6
data merge entity @s {}