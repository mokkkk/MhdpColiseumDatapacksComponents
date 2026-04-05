#> mhdp_items:weapons/bow/type_tec/16_shot_power_volley/main
#
# 剛射 メイン処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"剛連射"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..2 run playsound item.crossbow.loading_start master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 3..4 run playsound item.crossbow.loading_middle master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 8 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 8 run playsound item.crossbow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s Wpn.AnimationTimer matches 8 run playsound entity.arrow.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.2
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_tec/16_shot_power_volley/animation_0
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/bow/type_tec/16_shot_power_volley/animation_1
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/bow/type_tec/16_shot_power_volley/animation_2
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/bow/type_tec/16_shot_power_volley/animation_3

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 8 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_tec/16_shot_power_volley/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1 run tp @s ~ ~ ~ ~ ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..4 run tp @s ~ ~ ~ ~ ~0.25
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 5..6 run tp @s ~ ~ ~ ~ ~-0.7
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 7..8 run tp @s ~ ~ ~ ~ ~0.5

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump
    execute if score @s Wpn.GeneralTimer matches 20 run function api:weapon_operation/attribute_moveslow

# 移動
    execute if score @s Wpn.GeneralTimer matches 8 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 8 run scoreboard players set $strength player_motion.api.launch 1000
    execute if score @s Wpn.GeneralTimer matches 8 rotated ~180 0 run function player_motion:api/launch_looking

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 2

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartKeyJump] if score @s Wpn.GeneralTimer matches 1.. run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 1.. run function mhdp_items:core/buffering/b
    execute if score @s Wpn.GeneralTimer matches 1.. run function mhdp_items:core/buffering/arts_main

# 遷移
    # ジャンプ：チャージステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 21..26 if score @s Ply.Stats.Stamina matches 100.. run function mhdp_items:weapons/bow/type_tec/4_charge_step/start
    # ジャンプ：身躱し射法
        execute if entity @s[tag=Ply.Ope.Buffering.A,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 16..27 if score @s Ply.Stats.Arts.1 >= @s Ply.Stats.Arts.1.Max run function mhdp_items:weapons/bow/type_tec/11_moving_shot/start
        execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 16..27 if score @s Ply.Stats.Arts.1 >= @s Ply.Stats.Arts.1.Max run function mhdp_items:weapons/bow/type_tec/11_moving_shot/start
    # スニーク+右クリック長押し：竜の一矢に移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/bow/type_tec/6_shot_pierce/start

# 終了
    execute if entity @s[tag=Wpn.Bw.Tec.Shot.PowerVolley] if score @s Wpn.GeneralTimer matches 28..40 run function mhdp_items:weapons/bow/type_tec/16_shot_power_volley/end
