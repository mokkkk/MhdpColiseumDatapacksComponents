#> mhdp_items:weapons/short_sword/type_tec/10_spin/main
#
# 回転斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 4 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 4 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_0
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_1
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_2
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_3
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_4
    execute if score @s Wpn.AnimationTimer matches 5 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/10_spin/particle
    execute if score @s Wpn.AnimationTimer matches 5 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/10_spin/particle
    execute if score @s Wpn.AnimationTimer matches 5 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/10_spin/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/10_spin/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 run tp @s ~ ~ ~ ~-1.2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 6..9 run tp @s ~ ~ ~ ~2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 10..11 run tp @s ~ ~ ~ ~0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 3..15 run function mhdp_items:core/buffering/a

# 遷移
    # 右クリック短押し：通常コンボ2に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/short_sword/type_tec/10_spin/change_to_normal_1

# 終了
    execute if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/short_sword/type_tec/10_spin/end
