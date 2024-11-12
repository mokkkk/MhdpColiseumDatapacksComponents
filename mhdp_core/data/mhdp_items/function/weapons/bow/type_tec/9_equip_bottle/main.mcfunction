#> mhdp_items:weapons/bow/type_tec/9_equip_bottle/main
#
# ビン装填 メイン処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ビン装填"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run playsound block.iron_door.close master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.6
    execute if score @s Wpn.AnimationTimer matches 14 run playsound block.brewing_stand.brew master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 14 run playsound block.brewing_stand.brew master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_tec/9_equip_bottle/animation_0

# ビン装填
    execute if score @s Wpn.AnimationTimer matches 14 run scoreboard players set @s Wpn.Bw.Bottle.Count 8

# 終了
    execute if entity @s[tag=Wpn.Bw.Tec.Equip] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/bow/type_tec/9_equip_bottle/end
