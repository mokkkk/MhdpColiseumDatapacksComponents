#> mhdp_items:weapons/bow/type_normal/1_charge/main
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/bow/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"溜め"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches 3..11 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 3..11 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches 12 run playsound item.crossbow.loading_end master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 12 run playsound item.crossbow.loading_end master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/bow/type_normal/1_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/bow/type_normal/1_charge/animation_1
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/bow/type_normal/1_charge/animation_2
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/bow/type_normal/1_charge/animation_3

# 溜め
    execute if score @s Wpn.AnimationTimer matches 8 if score @s Wpn.Bw.ChargeCount matches ..1 run scoreboard players set @s Wpn.Bw.ChargeCount 1
    execute if score @s Wpn.AnimationTimer matches 15 if score @s Wpn.Bw.ChargeCount matches ..2 run scoreboard players set @s Wpn.Bw.ChargeCount 2
    execute if score @s Wpn.AnimationTimer matches 40 run function mhdp_items:weapons/bow/type_normal/1_charge/up_charge_count
    execute if entity @s[tag=Skill.Extra.BowChargeUp] if score @s Wpn.AnimationTimer matches 55 run function mhdp_items:weapons/bow/type_normal/1_charge/up_charge_count

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 2

# 遷移
    # ジャンプ：身躱し射法
        execute if entity @s[tag=Ply.Ope.StartKeyJump] if score @s Wpn.GeneralTimer matches 12.. if score @s Ply.Stats.Arts.1 >= @s Ply.Stats.Arts.1.Max run function mhdp_items:weapons/bow/type_normal/11_moving_shot/start
    # 右クリックを離した場合、射撃に移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 6.. run function mhdp_items:weapons/bow/type_normal/1_charge/change_to_shot
        execute if score @s Ply.Stats.Stamina matches ..0 run function mhdp_items:weapons/bow/type_normal/1_charge/change_to_shot
