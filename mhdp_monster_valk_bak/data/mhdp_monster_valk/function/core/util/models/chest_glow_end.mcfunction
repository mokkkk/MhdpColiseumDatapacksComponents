#> mhdp_monster_valk:core/util/models/chest_glow_end
#
# 胸発光終了時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    execute on passengers if entity @s[tag=aj.valk_aj.bone.body_0] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.body_0] run data modify entity @s item.components."minecraft:custom_model_data" set value 146
