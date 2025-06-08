#> mhdp_items:weapons/bow/type_normal/2_shot/main
#
# 射撃 メイン処理
#
# @within function mhdp_items:weapons/bow/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"射撃"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_normal/2_shot/animation_1
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/bow/type_normal/2_shot/animation_2
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/bow/type_normal/2_shot/animation_3
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/bow/type_normal/2_shot/animation_0
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/bow/type_normal/2_shot/animation_3
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/bow/type_normal/2_shot/animation_2

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_normal/2_shot/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~ ~ ~0.5 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~0.5 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 5..7 run tp @s ~ ~ ~ ~-0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength player_motion.api.launch 1500
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function player_motion:api/launch_looking

# 先行入力
    # execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 1..14 run function mhdp_items:core/buffering/a
    # execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 1..14 run function mhdp_items:core/buffering/a
# 遷移
    # スニーク+右クリック：剛射に移行
        # execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 8..21 if score @s Ply.Stats.Stamina matches 1.. run function mhdp_items:weapons/bow/type_normal/2_shot/change_to_shot_power

# 終了
    execute if entity @s[tag=Wpn.Bw.Normal.Shot] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/bow/type_normal/2_shot/end
