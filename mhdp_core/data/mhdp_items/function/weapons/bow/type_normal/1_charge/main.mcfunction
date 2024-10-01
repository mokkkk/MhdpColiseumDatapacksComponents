#> mhdp_items:weapons/bow/type_normal/1_charge/main
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/bow/type_normal/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches 3..20 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 3..20 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches 21 run playsound item.crossbow.loading_end master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 21 run playsound item.crossbow.loading_end master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/bow/type_normal/1_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/bow/type_normal/1_charge/animation_1
    execute if score @s Wpn.AnimationTimer matches 15 run function mhdp_items:weapons/bow/type_normal/1_charge/animation_2
    execute if score @s Wpn.AnimationTimer matches 24 run function mhdp_items:weapons/bow/type_normal/1_charge/animation_3

# 溜め
    execute if score @s Wpn.AnimationTimer matches 15 run scoreboard players set @s Wpn.Bw.ChargeCount 1
    execute if score @s Wpn.AnimationTimer matches 24 run scoreboard players set @s Wpn.Bw.ChargeCount 2
    execute if entity @s[tag=Skill.Extra.BowChargeUp] if score @s Wpn.AnimationTimer matches 40 run function mhdp_items:weapons/bow/type_normal/1_charge/up_charge_count

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 2

# 遷移
    # 右クリックを離した場合、射撃に移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 6.. run function mhdp_items:weapons/bow/type_normal/1_charge/change_to_shot
        execute if score @s Ply.Stats.Stamina matches ..0 run function mhdp_items:weapons/bow/type_normal/1_charge/change_to_shot
