# This file was generated by Animated Java via MC-Build. It is not recommended to edit this file directly.
execute unless entity @s[tag=aj.reus_aj.root] run return 0
execute on passengers if entity @s[tag=aj.reus_aj.data] unless data entity @s {data:{rigHash: 'adf34b1cf686473a4b9ead8ddaeb39e68fa1f70f2eb08697e691a99eec6ae8af'}} on vehicle run function animated_java:reus_aj/root/zzz/0
scoreboard players set @s aj.is_rig_loaded 1