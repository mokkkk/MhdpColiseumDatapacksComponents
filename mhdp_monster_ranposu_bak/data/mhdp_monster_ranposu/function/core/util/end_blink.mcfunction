#> mhdp_monster_ranposu:core/util/end_blink
#
# まばたき終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.end_blink

# モデル変更
    execute if entity @s[tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.ranposu_aj.bone.head_upper] run data modify entity @s item.components."minecraft:item_model" set value "animated_java:blueprint/ranposu_aj/head_upper"
    execute if entity @s[tag=Mns.Break.Head] on passengers if entity @s[tag=aj.ranposu_aj.bone.head_upper] run data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/ranposu/head_upper_break"
