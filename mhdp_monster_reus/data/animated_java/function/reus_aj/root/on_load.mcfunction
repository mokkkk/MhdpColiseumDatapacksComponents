# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[tag=aj.reus_aj.root] run return 0
execute on passengers if entity @s[tag=aj.reus_aj.data] unless data entity @s {data:{rigHash: '7ca5d563e9b649b217eef554bdbfa58205b7c7493fa107b0e60829d5f3399f29'}} on vehicle run function animated_java:reus_aj/root/zzz/0
scoreboard players set @s aj.is_rig_loaded 1