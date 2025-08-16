#> mhdp_items:weapons/bow/type_tec/13_jump_shot/main
#
# 昇天煌弓・箭射 メイン処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 操作表示
    # execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"昇天煌弓・箭射"}

# タイマー増加
    execute if score @s Wpn.GeneralTimer matches ..32 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 33 run scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GeneralTimer matches 34.. run scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    # 効果音・引き絞り
        execute if score @s Wpn.GeneralTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
        execute if score @s Wpn.GeneralTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
        execute if score @s Wpn.GeneralTimer matches 3..15 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
        execute if score @s Wpn.GeneralTimer matches 3..15 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.2
    # 効果音・射撃
        execute if score @s Wpn.GeneralTimer matches 35 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
        execute if score @s Wpn.GeneralTimer matches 35 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
        execute if score @s Wpn.GeneralTimer matches 35 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        execute if score @s Wpn.GeneralTimer matches 35 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
        execute if score @s Wpn.GeneralTimer matches 35 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
        execute if score @s Wpn.GeneralTimer matches 35 run playsound entity.firework_rocket.launch master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
        execute if score @s Wpn.GeneralTimer matches 35 run playsound entity.firework_rocket.launch master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    # アニメーション・引き絞り
        execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_0
        execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_1
        execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_2
    # アニメーション・射撃
        execute if score @s Wpn.GeneralTimer matches 35 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_4
        execute if score @s Wpn.GeneralTimer matches 36 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_5
        execute if score @s Wpn.GeneralTimer matches 38 run function mhdp_items:weapons/bow/type_tec/7_shot_horming/animation_6

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 35 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_tec/13_jump_shot/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~ ~ ~ ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~ ~0.25
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 35..36 run tp @s ~ ~ ~ ~1 ~-0.7
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 37..38 run tp @s ~ ~ ~ ~1 ~0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 39..40 run tp @s ~ ~ ~ ~-0.3 ~
    execute if score @s Wpn.GeneralTimer matches 1..33 anchored eyes run particle sneeze ^ ^ ^0.5 0.1 0.1 0.1 0.5 1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 35 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength player_motion.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 3 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 3 run scoreboard players set $strength player_motion.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~180 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 35 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 35 run scoreboard players set $strength player_motion.api.launch 8000
    execute if score @s Wpn.GeneralTimer matches 35 rotated ~180 0 run function player_motion:api/launch_looking

# 終了
    execute if score @s Wpn.GeneralTimer matches 46.. run function mhdp_items:weapons/bow/type_tec/13_jump_shot/end
