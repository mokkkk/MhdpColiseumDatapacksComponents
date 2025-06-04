#> mhdp_items:weapons/great_sword/type_normal/1_charge/main
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"溜め"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/great_sword/type_normal/1_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_normal/1_charge/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_normal/1_charge/animation_2

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 溜め
    execute if entity @s[tag=!Skill.Stamina.ShortCharge.1,tag=!Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 5
    execute if entity @s[tag=Skill.Stamina.ShortCharge.1] run scoreboard players add @s Wpn.Gs.ChargeTimer 6
    execute if entity @s[tag=Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 7
    execute if score @s Wpn.Gs.ChargeTimer matches 100.. if score @s Wpn.Gs.ChargeCount matches ..0 run function mhdp_items:weapons/great_sword/type_normal/1_charge/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 200.. if score @s Wpn.Gs.ChargeCount matches ..1 run function mhdp_items:weapons/great_sword/type_normal/1_charge/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 300.. if score @s Wpn.Gs.ChargeCount matches ..2 run function mhdp_items:weapons/great_sword/type_normal/1_charge/up_charge_count

# 遷移
    # 右クリックを離した場合、溜め斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/start
    # 溜めすぎた場合、自動的に溜め斬りに移行
        execute if score @s Wpn.Gs.ChargeTimer matches 450.. run scoreboard players set @s Wpn.Gs.ChargeCount 2
        execute if score @s Wpn.Gs.ChargeTimer matches 450.. run function mhdp_items:weapons/great_sword/type_normal/2_chargeattack/start
