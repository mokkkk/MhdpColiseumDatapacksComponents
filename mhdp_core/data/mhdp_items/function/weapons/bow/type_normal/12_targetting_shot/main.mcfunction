#> mhdp_items:weapons/bow/type_normal/12_targetting_shot/main
#
# 昇天煌弓・箭射 メイン処理
#
# @within function mhdp_items:weapons/bow/type_normal/main

# 操作表示
    # execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"昇天煌弓・箭射"}

# タイマー増加
    execute if score @s Wpn.GeneralTimer matches ..22 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 23 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GeneralTimer matches 24.. run scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    # 効果音・引き絞り
        execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_end master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
        execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_end master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    # 効果音・射撃
        execute if score @s Wpn.GeneralTimer matches 25 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
        execute if score @s Wpn.GeneralTimer matches 25 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
        execute if score @s Wpn.GeneralTimer matches 25 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        execute if score @s Wpn.GeneralTimer matches 25 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
        execute if score @s Wpn.GeneralTimer matches 25 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
        execute if score @s Wpn.GeneralTimer matches 25 run playsound entity.firework_rocket.launch master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
        execute if score @s Wpn.GeneralTimer matches 25 run playsound entity.firework_rocket.launch master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    # アニメーション・引き絞り
        execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_normal/7_shot_shower/animation_0
        execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/bow/type_normal/7_shot_shower/animation_1
    # アニメーション・射撃
        execute if score @s Wpn.GeneralTimer matches 25 run function mhdp_items:weapons/bow/type_normal/7_shot_shower/animation_4
        execute if score @s Wpn.GeneralTimer matches 26 run function mhdp_items:weapons/bow/type_normal/7_shot_shower/animation_5
        execute if score @s Wpn.GeneralTimer matches 27 run function mhdp_items:weapons/bow/type_normal/7_shot_shower/animation_6
        execute if score @s Wpn.GeneralTimer matches 29 run function mhdp_items:weapons/bow/type_normal/7_shot_shower/animation_7

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 25 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_normal/12_targetting_shot/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~ ~ ~ ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~ ~0.25
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 25..26 run tp @s ~ ~ ~ ~1 ~-0.7
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 27..28 run tp @s ~ ~ ~ ~1 ~0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 29..30 run tp @s ~ ~ ~ ~-0.3 ~
    execute if score @s Wpn.GeneralTimer matches 1..23 anchored eyes run particle firework ^ ^ ^0.5 0.1 0.1 0.1 0.5 1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 25 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 25 run scoreboard players set $strength player_motion.api.launch 8000
    execute if score @s Wpn.GeneralTimer matches 25 rotated ~180 0 run function player_motion:api/launch_looking

# 昇天煌弓に遷移
    execute if score @s Wpn.GeneralTimer matches 36 run function mhdp_items:weapons/bow/type_normal/13_jump_shot/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 37.. run function mhdp_items:weapons/bow/type_normal/12_targetting_shot/end
