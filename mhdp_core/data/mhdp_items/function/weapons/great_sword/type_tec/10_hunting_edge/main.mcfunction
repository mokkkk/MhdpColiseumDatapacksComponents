#> mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/main
#
# ハンティングエッジ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/2_chargeattack/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/great_sword/type_tec/2_chargeattack/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/2_chargeattack/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/2_chargeattack/animation_3
    execute if score @s Wpn.AnimationTimer matches 1 positioned ^ ^2 ^ rotated ~ ~-30 run function mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ^ ^ ^0.3 rotated ~ ~ run function mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/attack

# 抜刀攻撃終了
    execute if score @s Wpn.GeneralTimer matches 5 run tag @s remove Ply.Flag.DrawAttack

# 遷移
    # ヒットした場合、空中溜めに移行
        execute if entity @s[tag=Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/change_to_charge

# 終了
    execute if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/great_sword/type_tec/10_hunting_edge/end
