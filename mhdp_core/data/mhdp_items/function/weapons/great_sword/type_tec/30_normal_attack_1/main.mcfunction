#> mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/main
#
# 相殺斬り上げ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"通常攻撃・１"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.6
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/animation_2
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/animation_3
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/animation_4
    execute if score @s Wpn.AnimationTimer matches 4 positioned ~ ~2.35 ~ positioned ^-1.5 ^ ^1.7 run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/particle
    execute if score @s Wpn.AnimationTimer matches 4 positioned ~ ~2.35 ~ positioned ^-1.5 ^ ^2.2 run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/particle
    execute if score @s Wpn.AnimationTimer matches 5 positioned ~ ~0.95 ~ positioned ^1.5 ^ ^1.7 run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/particle
    execute if score @s Wpn.AnimationTimer matches 5 positioned ~ ~0.95 ~ positioned ^1.5 ^ ^2.2 run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/attack

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick] if score @s Wpn.GeneralTimer matches 2..16 run function mhdp_items:core/buffering/a

# 遷移
    # 左クリック：通常攻撃2に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 17.. run function mhdp_items:weapons/great_sword/type_tec/30_normal_attack_1/end
