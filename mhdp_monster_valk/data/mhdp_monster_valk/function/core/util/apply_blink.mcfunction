#> mhdp_monster_valk:core/util/apply_blink
#
# まばたき開始時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    # execute on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.id set value "minecraft:white_dye"
    # execute if entity @s[tag=!Mns.Break.Head,tag=!Mns.Valk.State.HeadHeat,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 67
    # execute if entity @s[tag=Mns.Break.Head,tag=!Mns.Valk.State.HeadHeat,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 68
    # execute if entity @s[tag=Mns.State.IsAnger,tag=!Mns.Break.Head,tag=!Mns.Valk.State.HeadHeat] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 69
    # execute if entity @s[tag=Mns.Valk.State.HeadHeat,tag=!Mns.Break.Head,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 70
    # execute if entity @s[tag=Mns.Break.Head,tag=Mns.State.IsAnger,tag=!Mns.Valk.State.HeadHeat] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 71
    # execute if entity @s[tag=Mns.Break.Head,tag=Mns.Valk.State.HeadHeat,tag=!Mns.State.IsAnger] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 72
    # execute if entity @s[tag=Mns.Valk.State.HeadHeat,tag=Mns.State.IsAnger,tag=!Mns.Break.Head] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 73
    # execute if entity @s[tag=Mns.Valk.State.HeadHeat,tag=Mns.State.IsAnger,tag=Mns.Break.Head] on passengers if entity @s[tag=aj.valk_aj.bone.head_upper] run data modify entity @s item.components."minecraft:custom_model_data" set value 74
