#> mhdp_items:weapons/bow/type_normal/15_quick_shot/main
#
# クイックショット メイン処理
#
# @within function mhdp_items:weapons/bow/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"クイックショット"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 5 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 5 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_normal/15_quick_shot/animation_0
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/bow/type_normal/15_quick_shot/animation_1
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/bow/type_normal/15_quick_shot/animation_2
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/bow/type_normal/15_quick_shot/animation_3

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 6 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_normal/15_quick_shot/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~ ~ ~ ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 5..6 run tp @s ~ ~ ~ ~ ~0.25

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength player_motion.api.launch 1000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function player_motion:api/launch_looking

# 終了
    execute if entity @s[tag=Wpn.Bw.Normal.QuickShot] if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/bow/type_normal/15_quick_shot/end
