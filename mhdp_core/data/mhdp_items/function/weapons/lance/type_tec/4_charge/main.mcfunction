#> mhdp_items:weapons/lance/type_tec/4_charge/main
#
# 薙ぎ払い メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main


# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"溜め"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/4_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/lance/type_tec/4_charge/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/lance/type_tec/4_charge/animation_2

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 at @s run tp @s ~ ~ ~ ~-1.5 ~0.3
    execute if score @s Wpn.GeneralTimer matches 23 run playsound entity.experience_orb.pickup master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 23 positioned ~ ~1.65 ~ run particle flash{color:[1.000,1.000,1.000,1.00]} ^ ^ ^0.5 0 0 0 0 1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 遷移
    # 右クリック解除：薙ぎ払いに移行
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 10..22 run function mhdp_items:weapons/lance/type_tec/5_sweep/start
    # 一定時間後右クリック解除 or 強制：溜め薙ぎ払いに移行
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 23..27 run function mhdp_items:weapons/lance/type_tec/5_sweep/start_charge
        execute if score @s Wpn.GeneralTimer matches 30.. run function mhdp_items:weapons/lance/type_tec/5_sweep/start_charge

# 終了
    execute if score @s Wpn.GeneralTimer matches 60.. run function mhdp_items:weapons/lance/type_tec/4_charge/end
