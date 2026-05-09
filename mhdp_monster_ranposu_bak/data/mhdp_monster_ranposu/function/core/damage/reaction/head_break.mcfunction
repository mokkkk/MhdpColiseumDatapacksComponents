#> mhdp_monster_ranposu:core/damage/reaction/head_break
#
# 怯みリアクション 頭部位破壊
#
# @within function mhdp_monster_ranposu:core/damage/damage

# 状態更新
    tag @s add Mns.Break.Head

# 効果音
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9

# モデル変更
    execute if entity @s[tag=!Mns.State.IsBlink] on passengers if entity @s[tag=aj.ranposu_aj.bone.head_upper] run data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/ranposu/head_upper_break"
    execute if entity @s[tag=Mns.State.IsBlink] on passengers if entity @s[tag=aj.ranposu_aj.bone.head_upper] run data modify entity @s item.components."minecraft:item_model" set value "minecraft:aj_sub/ranposu/head_upper_break_blink"

# トースト表示
    function mhdp_monster_ranposu:core/util/show_toast
