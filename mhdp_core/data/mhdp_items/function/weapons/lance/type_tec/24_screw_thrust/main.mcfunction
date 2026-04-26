#> mhdp_items:weapons/lance/type_tec/24_screw_thrust/main
#
# 溜めカウンター メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main


# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"スクリュースラスト"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1..20 run playsound entity.breeze.inhale master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 0.5 0.5
    execute if score @s Wpn.AnimationTimer matches 21..40 run playsound entity.breeze.inhale master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 0.5 0.6
    execute if score @s Wpn.AnimationTimer matches 41..50 run playsound entity.breeze.inhale master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 0.5 0.7
    execute if score @s Wpn.AnimationTimer matches 1.. anchored eyes run particle cloud ~ ~1 ~ 0.7 1 0.7 0.05 1
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/animation_2

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 5 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:2000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 7 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 at @s run tp @s ~ ~ ~ ~1.5 ~0.3

# 溜め
    scoreboard players add @s Wpn.Lc.ChargeTimer 1
    execute if score @s Wpn.Lc.ChargeTimer matches 20.. if score @s Wpn.Lc.ChargeCount matches ..0 run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/up_charge_count
    execute if score @s Wpn.Lc.ChargeTimer matches 40.. if score @s Wpn.Lc.ChargeCount matches ..1 run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/up_charge_count
    execute if score @s Wpn.Lc.ChargeTimer matches 60.. if score @s Wpn.Lc.ChargeCount matches ..2 run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/up_charge_count

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 遷移
    # 右クリック解除 or 強制：攻撃に移行
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 8..59 run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/start
        execute if score @s Wpn.GeneralTimer matches 61.. run function mhdp_items:weapons/lance/type_tec/25_screw_thrust_spear/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 151.. run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/end
