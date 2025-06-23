#> mhdp_items:weapons/great_sword/type_tec/13_upper_charge/main
#
# 相殺斬り上げ・溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"相殺斬り上げ・溜め"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/animation_2
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/animation_3
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/animation_4

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 溜め
    execute if entity @s[tag=!Skill.Stamina.ShortCharge.1,tag=!Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 5
    execute if entity @s[tag=Skill.Stamina.ShortCharge.1] run scoreboard players add @s Wpn.Gs.ChargeTimer 6
    execute if entity @s[tag=Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 7
    execute if score @s Wpn.Gs.ChargeTimer matches 100.. if score @s Wpn.Gs.ChargeCount matches ..0 run function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 200.. if score @s Wpn.Gs.ChargeCount matches ..1 run function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 300.. if score @s Wpn.Gs.ChargeCount matches ..2 run function mhdp_items:weapons/great_sword/type_tec/13_upper_charge/up_charge_count

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength player_motion.api.launch 6000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function player_motion:api/launch_looking

# 演出
   execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..5 run tp @s ~ ~ ~ ~ ~0.6
   execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..8 at @s run tp @s ~ ~ ~ ~0.5 ~

# 遷移
    # 右クリックを離した場合、相殺斬り上げに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/start
    # 溜めすぎた場合、自動的に相殺斬り上げに移行
        execute if score @s Wpn.Gs.ChargeTimer matches 450.. run scoreboard players set @s Wpn.Gs.ChargeCount 2
        execute if score @s Wpn.Gs.ChargeTimer matches 450.. run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/start
