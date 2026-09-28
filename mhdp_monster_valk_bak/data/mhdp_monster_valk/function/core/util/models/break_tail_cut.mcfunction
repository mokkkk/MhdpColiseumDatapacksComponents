#> mhdp_monster_valk:core/util/models/break_tail_cut
#
# 尻尾切断時のモデル変更
#
# @within function mhdp_monsters:core/switch/macro/m.apply_blink

# モデル変更
    # execute on passengers if entity @s[tag=aj.valk_aj.bone.tail_3] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.valk_aj.bone.tail_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 1
