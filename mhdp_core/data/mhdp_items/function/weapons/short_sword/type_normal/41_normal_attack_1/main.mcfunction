#> mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/main
#
# 通常攻撃2 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"通常攻撃・２"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/animation_3
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/attack
    execute if score @s Wpn.GeneralTimer matches 4 run tag @s remove Ply.Flag.DrawAttack

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick] if score @s Wpn.GeneralTimer matches 2..7 run function mhdp_items:core/buffering/a
    execute if score @s Wpn.GeneralTimer matches 2..7 run function mhdp_items:core/buffering/arts_main

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_normal/31_blade_dance/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_normal/30_upper_bash/start

# 遷移
    # 右クリック：剣コンボ1に移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_normal/1_sword_1/start
    # 左クリック：通常攻撃2に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_normal/42_normal_attack_2/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 8.. run function mhdp_items:weapons/short_sword/type_normal/41_normal_attack_1/end
