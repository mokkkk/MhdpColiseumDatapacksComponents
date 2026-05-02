#> mhdp_items:weapons/lance/type_normal/11_high_spear/main
#
# 強突き メイン処理
#
# @within function mhdp_items:weapons/lance/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"強突き"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 7 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_normal/11_high_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/lance/type_normal/11_high_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/lance/type_normal/11_high_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/lance/type_normal/11_high_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/lance/type_normal/11_high_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/lance/type_normal/11_high_spear/animation_5
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/lance/type_normal/11_high_spear/animation_6
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_normal/11_high_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_normal/11_high_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_normal/11_high_spear/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 8 run function mhdp_items:weapons/lance/type_normal/11_high_spear/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 6 rotated ~0 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 6..7 at @s run tp @s ~ ~ ~ ~ ~-0.5

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if score @s Wpn.GeneralTimer matches 3..16 run function mhdp_items:core/buffering/arts_main

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 16 run function mhdp_items:weapons/lance/type_normal/22_guard_rage/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 16 run function mhdp_items:weapons/lance/type_normal/24_screw_thrust/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 17.. run function mhdp_items:weapons/lance/type_normal/11_high_spear/end
