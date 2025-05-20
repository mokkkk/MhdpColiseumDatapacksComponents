#> mhdp_items:weapons/bow/type_tec/1_charge/main
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"溜め"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches 3..4 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 3..4 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/bow/type_tec/1_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/bow/type_tec/1_charge/animation_1
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/bow/type_tec/1_charge/animation_2
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/bow/type_tec/1_charge/animation_3

# 移動制限

# 溜め
    execute if entity @s[tag=!Skill.Stamina.ShortCharge.1,tag=!Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Bw.ChargeTimer 5
    execute if entity @s[tag=Skill.Stamina.ShortCharge.1] run scoreboard players add @s Wpn.Bw.ChargeTimer 6
    execute if entity @s[tag=Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Bw.ChargeTimer 7
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeTimer matches 100.. if score @s Wpn.Bw.ChargeCount matches ..1 run function mhdp_items:weapons/bow/type_tec/1_charge/up_charge_count
    execute if entity @s[tag=Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeTimer matches 100.. if score @s Wpn.Bw.ChargeCount matches ..2 run function mhdp_items:weapons/bow/type_tec/1_charge/up_charge_count

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 2
    execute if score @s Wpn.GeneralTimer matches 10.. run scoreboard players add @s Wpn.Bw.Gauge 1

# 遷移
    # 右クリックを離した場合、射撃に移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/bow/type_tec/1_charge/change_to_shot
        execute if score @s Ply.Stats.Stamina matches ..0 run function mhdp_items:weapons/bow/type_tec/1_charge/change_to_shot
    # ジャンプした場合、チャージステップに移行
        execute if entity @s[tag=Ply.Ope.StartKeyJump] if score @s Wpn.GeneralTimer matches 12.. if score @s Ply.Stats.Stamina matches 100.. run function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargestep
