#> mhdp_monster_valk:core/util/end_blink
#
# まばたき終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.end_blink

# モデル変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 76
    execute if entity @s[tag=Mns.Break.Head,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 78
    execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 77
    execute if entity @s[tag=Mns.Break.Head,tag=Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 79
