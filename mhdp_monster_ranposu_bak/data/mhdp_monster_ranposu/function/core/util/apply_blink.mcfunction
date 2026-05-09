#> mhdp_monster_ranposu:core/util/apply_blink
#
# まばたき開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    execute if entity @s[tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.ranposu_aj.bone.head_upper] run data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/ranposu/head_upper_blink"
    execute if entity @s[tag=Mns.Break.Head] on passengers if entity @s[tag=aj.ranposu_aj.bone.head_upper] run data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/ranposu/head_upper_break_blink"
