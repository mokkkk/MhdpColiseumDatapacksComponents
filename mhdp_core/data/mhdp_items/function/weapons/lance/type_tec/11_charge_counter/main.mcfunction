#> mhdp_items:weapons/lance/type_tec/11_charge_counter/main
#
# 溜めカウンター メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main


# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"溜めカウンター"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/11_charge_counter/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/lance/type_tec/11_charge_counter/animation_1
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/lance/type_tec/11_charge_counter/animation_2

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 5 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 7 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:1000, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 at @s run tp @s ~ ~ ~ ~1.5 ~0.3
    # execute if score @s Wpn.GeneralTimer matches 20 run playsound entity.experience_orb.pickup master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    # execute if score @s Wpn.GeneralTimer matches 20 positioned ~ ~1.65 ~ run particle flash{color:[1.000,1.000,1.000,1.00]} ^ ^ ^0.5 0 0 0 0 1

# 溜め
    execute if entity @s[tag=!Skill.Stamina.ShortCharge.1,tag=!Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Lc.ChargeTimer 5
    execute if entity @s[tag=Skill.Stamina.ShortCharge.1] run scoreboard players add @s Wpn.Lc.ChargeTimer 6
    execute if entity @s[tag=Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Lc.ChargeTimer 7
    execute if score @s Wpn.Lc.ChargeTimer matches 300.. if score @s Wpn.Lc.ChargeCount matches ..0 run function mhdp_items:weapons/lance/type_tec/11_charge_counter/up_charge_count
    execute if score @s Wpn.Lc.ChargeTimer matches 600.. if score @s Wpn.Lc.ChargeCount matches ..1 run function mhdp_items:weapons/lance/type_tec/11_charge_counter/up_charge_count

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 遷移
    # ジャンプ：パワーガードに移行
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=Ply.Ope.IsKeyJump] if score @s Wpn.GeneralTimer matches 1..149 run function mhdp_items:weapons/lance/type_tec/11_charge_counter/change_to_power_guard
    # 右クリック解除 or 強制：カウンター突きに移行
        execute if entity @s[tag=Ply.Weapon.Drawing,tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 1..149 run function mhdp_items:weapons/lance/type_tec/12_counter_spear/start
        execute if score @s Wpn.GeneralTimer matches 150.. run function mhdp_items:weapons/lance/type_tec/12_counter_spear/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 151.. run function mhdp_items:weapons/lance/type_tec/11_charge_counter/end
