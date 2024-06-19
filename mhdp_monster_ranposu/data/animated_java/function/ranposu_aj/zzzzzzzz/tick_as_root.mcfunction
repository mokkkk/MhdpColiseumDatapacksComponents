execute unless score @s aj.ranposu_aj.rig_loaded = @s aj.ranposu_aj.rig_loaded run function animated_java:ranposu_aj/zzzzzzzz/on_load
scoreboard players add @s aj.life_time 1
execute at @s on passengers run tp @s ~ ~ ~ ~ ~
function animated_java:ranposu_aj/zzzzzzzz/animations/tick
function #animated_java:ranposu_aj/on_tick/as_root