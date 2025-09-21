#> mhdp_items:weapons/bow/type_normal/14_air_shot/main
#
# 射撃 メイン処理
#
# @within function mhdp_items:weapons/bow/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"飛燕撃ち"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 3 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s Wpn.AnimationTimer matches 3 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_normal/14_air_shot/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/bow/type_normal/14_air_shot/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/bow/type_normal/14_air_shot/animation_3
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/bow/type_normal/14_air_shot/animation_0
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/bow/type_normal/14_air_shot/animation_3
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/bow/type_normal/14_air_shot/animation_2

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_normal/14_air_shot/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 run tp @s ~ ~ ~ ~1 ~-0.7
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~ ~0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 5..7 run tp @s ~ ~ ~ ~-0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/bow/type_normal/14_air_shot/move

# 終了
    execute if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/bow/type_normal/14_air_shot/end
