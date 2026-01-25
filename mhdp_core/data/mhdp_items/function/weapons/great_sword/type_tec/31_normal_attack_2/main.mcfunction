#> mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/main
#
# 相殺斬り上げ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"通常攻撃・２"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.6
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/animation_4
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/animation_2
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/animation_3
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/animation_4
    execute if score @s Wpn.AnimationTimer matches 4 positioned ~ ~1.85 ~ positioned ^1.5 ^ ^1.7 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/particle
    execute if score @s Wpn.AnimationTimer matches 4 positioned ~ ~1.85 ~ positioned ^1.5 ^ ^2.2 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/particle
    execute if score @s Wpn.AnimationTimer matches 5 positioned ~ ~1.65 ~ positioned ^-1.5 ^ ^1.7 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/particle
    execute if score @s Wpn.AnimationTimer matches 5 positioned ~ ~1.65 ~ positioned ^-1.5 ^ ^2.2 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/attack

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick] if score @s Wpn.GeneralTimer matches 2..16 run function mhdp_items:core/buffering/a
    execute if score @s Wpn.GeneralTimer matches 3..16 run function mhdp_items:core/buffering/arts_main

# 遷移
    # 右クリック：溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 17.. run function mhdp_items:weapons/great_sword/type_tec/1_charge/start
    # スニーク+右クリック：溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 17.. run function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/start
    # 左クリック：通常攻撃3に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/great_sword/type_tec/32_normal_attack_3/start

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 17.. run function mhdp_items:weapons/great_sword/type_tec/19_counter_stance/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 17.. run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/great_sword/type_tec/31_normal_attack_2/end
