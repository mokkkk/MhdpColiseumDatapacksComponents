#> mhdp_items:weapons/short_sword/type_tec/5_horizon_2/main
#
# 水平斬りコンボ2 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 2 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/animation_3
    execute if score @s Wpn.AnimationTimer matches 3 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/particle
    execute if score @s Wpn.AnimationTimer matches 3 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/particle
    execute if score @s Wpn.AnimationTimer matches 3 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..4 run tp @s ~ ~ ~ ~0.8 ~-1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true

# 先行入力
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long] if score @s Wpn.GeneralTimer matches 2..15 run function mhdp_items:core/buffering/a

# 遷移
    # 右クリック短押し：通常コンボ2に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/change_to_horizon_3

# 終了
    execute if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/short_sword/type_tec/5_horizon_2/end