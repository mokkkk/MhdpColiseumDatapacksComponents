scoreboard players operation @s aj.id = .aj.last_id aj.id
tag @s remove aj.new
function #animated_java:ranposu_aj/on_summon/as_rig_entities
execute if entity @s[tag=aj.ranposu_aj.bone] run function #animated_java:ranposu_aj/zzzzzzzz/on_summon/as_bones
execute if entity @s[tag=aj.ranposu_aj.locator_origin] run function animated_java:ranposu_aj/zzzzzzzz/summon/as_locator_origins
