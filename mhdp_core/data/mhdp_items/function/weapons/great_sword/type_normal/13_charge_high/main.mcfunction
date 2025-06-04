#> mhdp_items:weapons/great_sword/type_normal/13_charge_high/main
#
# 大溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"大溜め"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches 12 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.5
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/great_sword/type_normal/13_charge_high/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_normal/13_charge_high/animation_1
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/great_sword/type_normal/13_charge_high/animation_0
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/great_sword/type_normal/13_charge_high/animation_3

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 溜め
    execute if entity @s[tag=!Skill.Stamina.ShortCharge.1,tag=!Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 5
    execute if entity @s[tag=Skill.Stamina.ShortCharge.1] run scoreboard players add @s Wpn.Gs.ChargeTimer 6
    execute if entity @s[tag=Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 7
    execute if score @s Wpn.Gs.ChargeTimer matches 170.. if score @s Wpn.Gs.ChargeCount matches ..0 run function mhdp_items:weapons/great_sword/type_normal/13_charge_high/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 340.. if score @s Wpn.Gs.ChargeCount matches ..1 run function mhdp_items:weapons/great_sword/type_normal/13_charge_high/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 510.. if score @s Wpn.Gs.ChargeCount matches ..2 run function mhdp_items:weapons/great_sword/type_normal/13_charge_high/up_charge_count
    execute if score @s Wpn.Gs.ChargeCount matches ..2 run particle trial_spawner_detection ~ ~1.2 ~ 0.4 0.3 0.4 0.0 1
    execute if score @s Wpn.Gs.ChargeCount matches 3.. run particle trial_spawner_detection ~ ~1.2 ~ 0.4 0.3 0.4 0.0 1
    execute if score @s Wpn.Gs.ChargeCount matches 3.. run particle trial_spawner_detection_ominous ~ ~1.2 ~ 0.4 0.3 0.4 0.0 1

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength player_motion.api.launch 10000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 3 run scoreboard players set $strength player_motion.api.launch 7000
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~180 0 run function player_motion:api/launch_looking
# 演出
   execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..8 at @s run tp @s ~ ~ ~ ~ ~-0.5

# 遷移
    # 右クリックを離した場合、大溜め斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/great_sword/type_normal/14_chargeattack_high/start
