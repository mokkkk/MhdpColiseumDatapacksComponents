#> mhdp_monster_reus:core/damage/reaction/tail_break
#
# 怯みリアクション 尻尾部位破壊
#
# @within function mhdp_monster_reus:core/damage/damage

# 状態更新
    tag @s add Mns.Break.Tail
    tag @s add Mns.Reus.Temp.Tail.Break

# ダウン・スタン・麻痺・罠をキャンセルする
    tag @s remove Mns.State.IsDown
    tag @s remove Mns.State.IsStun
    tag @s remove Mns.State.IsParalysis
    tag @s remove Mns.State.IsParalyseTrap
    tag @s remove Mns.State.IsHallTrap

# 効果音
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

# モデル変更
    execute on passengers if entity @s[tag=aj.reus_aj.bone.tail_2] run data modify entity @s item.id set value "minecraft:white_dye"
    execute on passengers if entity @s[tag=aj.reus_aj.bone.tail_2] run data modify entity @s item.components."minecraft:custom_model_data" set value 9
    execute on passengers if entity @s[tag=aj.reus_aj.bone.tail_3] run data modify entity @s item.components."minecraft:custom_model_data" set value 1

# 尻尾設置
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/damage/reaction/macro/m.summon_tail with entity @s data.locators.pos_tail_3

# トースト表示
    function mhdp_monster_reus:core/util/show_toast
