#> mhdp_items:weapons/great_sword/type_tec/8_charge_super/main
#
# 強溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @s ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @s ~ ~ ~ 1 0.9
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/animation_2
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/animation_3
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/animation_4
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/animation_5

# 移動制限
    effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 15 run attribute @s generic.jump_strength modifier remove f-f-f-a-3
    execute if score @s Wpn.GeneralTimer matches 15 run attribute @s generic.jump_strength modifier add f-f-f-a-3 "武器の個別ジャンプ力" -0.3 add_value

# 溜め
    execute if score @s Wpn.GeneralTimer matches 14.. if entity @s[tag=!Skill.Stamina.ShortCharge.1,tag=!Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 5
    execute if score @s Wpn.GeneralTimer matches 14.. if entity @s[tag=Skill.Stamina.ShortCharge.1] run scoreboard players add @s Wpn.Gs.ChargeTimer 6
    execute if score @s Wpn.GeneralTimer matches 14.. if entity @s[tag=Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 7
    execute if score @s Wpn.Gs.ChargeTimer matches 100.. if score @s Wpn.Gs.ChargeCount matches ..0 run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 200.. if score @s Wpn.Gs.ChargeCount matches ..1 run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 300.. if score @s Wpn.Gs.ChargeCount matches ..2 run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/up_charge_count

# 演出
    execute if score @s Wpn.GeneralTimer matches 18.. run particle crimson_spore ~ ~1 ~ 0.5 1 0.5 1 5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..10 run tp @s ~ ~ ~ ~ ~-0.5

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 2000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 4 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 4 run scoreboard players set $strength delta.api.launch 2000
    execute if score @s Wpn.GeneralTimer matches 4 rotated ~180 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 7 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 7 run scoreboard players set $strength delta.api.launch 2000
    execute if score @s Wpn.GeneralTimer matches 7 rotated ~180 0 run function delta:api/launch_looking

# 遷移
    # 右クリックを離した場合、溜め斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 22.. run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/change_to_chargeattack
    # 溜めすぎた場合、自動的に溜め斬りに移行
        execute if score @s Wpn.Gs.ChargeTimer matches 450.. run scoreboard players set @s Wpn.Gs.ChargeCount 2
        execute if score @s Wpn.Gs.ChargeTimer matches 450.. run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/change_to_chargeattack
    # ジャンプした場合、タックルに移行
        execute if entity @s[tag=Ply.Ope.StartJump,tag=!Wpn.Gs.Normal.ChargeSlash] if score @s Wpn.GeneralTimer matches 22.. if score @s Ply.Stats.Stamina matches 150.. run function mhdp_items:weapons/great_sword/type_tec/8_charge_super/change_to_tackle
