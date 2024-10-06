#> mhdp_items:weapons/short_sword/type_normal/10_charge/main
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..5 run function mhdp_items:weapons/short_sword/type_normal/10_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/short_sword/type_normal/10_charge/animation_1

# 演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 10 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if entity @s[tag=!Skill.Stamina.ShortCharge.1,tag=!Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Ss.ChargeTimer 5
    execute if entity @s[tag=Skill.Stamina.ShortCharge.1] run scoreboard players add @s Wpn.Ss.ChargeTimer 6
    execute if entity @s[tag=Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Ss.ChargeTimer 7
    execute if score @s Wpn.Ss.ChargeTimer matches 120.. if score @s Wpn.Ss.ChargeCount matches ..0 run function mhdp_items:weapons/short_sword/type_normal/10_charge/up_charge_count
    execute if score @s Wpn.Ss.ChargeTimer matches 300.. if score @s Wpn.Ss.ChargeCount matches ..1 run function mhdp_items:weapons/short_sword/type_normal/10_charge/up_charge_count
    execute if score @s Wpn.Ss.ChargeTimer matches 450.. if score @s Wpn.Ss.ChargeCount matches ..2 run function mhdp_items:weapons/short_sword/type_normal/10_charge/up_charge_count

# 遷移
    # 溜め0：回転斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 15.. if score @s Wpn.Ss.ChargeCount matches ..0 run function mhdp_items:weapons/short_sword/type_normal/10_charge/change_to_spin
    # 溜め1：盾攻撃に移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 15.. if score @s Wpn.Ss.ChargeCount matches 1 run function mhdp_items:weapons/short_sword/type_normal/10_charge/change_to_bash

# 終了
    execute if score @s Wpn.GeneralTimer matches 1000.. run function mhdp_items:weapons/short_sword/type_normal/10_charge/end
