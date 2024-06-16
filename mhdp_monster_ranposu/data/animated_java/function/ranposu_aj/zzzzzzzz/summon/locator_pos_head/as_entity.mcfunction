tp @s ^0 ^1.3125 ^1.875 ~0 ~0
data modify storage animated_java Owner set from entity @s UUID
tag @s remove aj.new
function #animated_java:ranposu_aj/on_summon/as_locator_entities