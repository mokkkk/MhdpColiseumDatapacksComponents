summon minecraft:item_display ~ ~ ~ {shadow_radius:1.2f,Tags:["aj.ranposu_aj.locator","aj.ranposu_aj.locator.shadow","aj.new"],CustomName:"[{\"text\":\"[\",\"color\":\"gray\"},{\"text\":\"AJ\",\"color\":\"aqua\"},\"] \",[\"\",{\"text\":\"ranposu_aj\",\"color\":\"light_purple\"},\".\",{\"text\":\"locatorEntity\",\"color\":\"white\"},\"[\",{\"text\":\"shadow\",\"color\":\"yellow\"},\"]\"]]"}
execute as @e[type=minecraft:item_display,tag=aj.ranposu_aj.locator.shadow,tag=aj.new,limit=1,distance=..1] run function animated_java:ranposu_aj/zzzzzzzz/summon/locator_shadow/as_entity
data modify entity @s Owner set from storage animated_java Owner
data remove storage animated_java Owner