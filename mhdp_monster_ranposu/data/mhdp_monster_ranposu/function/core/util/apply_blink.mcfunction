#> mhdp_monster_ranposu:core/util/apply_blink
#
# まばたき開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    execute if entity @s[tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.ranposu_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 24
    execute if entity @s[tag=Mns.Break.Head] on passengers if entity @s[tag=aj.ranposu_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 26
