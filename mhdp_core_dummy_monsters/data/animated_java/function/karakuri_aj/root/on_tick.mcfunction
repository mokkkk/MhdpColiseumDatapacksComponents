# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[tag=aj.karakuri_aj.root] run return 0
function #animated_java:karakuri_aj/as_root/pre_tick
execute if entity @s[tag=aj.karakuri_aj.animation.idle.playing] run function animated_java:karakuri_aj/animations/idle/zzz/on_tick
execute if entity @s[tag=aj.karakuri_aj.animation.damage_counter.playing] run function animated_java:karakuri_aj/animations/damage_counter/zzz/on_tick
execute if entity @s[tag=aj.karakuri_aj.animation.bite.playing] run function animated_java:karakuri_aj/animations/bite/zzz/on_tick
execute on passengers if entity @s[tag=aj.karakuri_aj.data] run function animated_java:karakuri_aj/root/zzz/0
execute at @s on passengers run tp @s ~ ~ ~ ~ ~
function #animated_java:karakuri_aj/as_root/post_tick