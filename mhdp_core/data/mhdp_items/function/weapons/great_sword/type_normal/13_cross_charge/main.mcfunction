#> mhdp_items:weapons/great_sword/type_normal/13_cross_charge/main
#
# 十字斬り溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/animation_2
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/animation_3

# 移動制限
    effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 15 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 15 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.3 add_value

# 溜め
    execute if entity @s[tag=!Skill.Stamina.ShortCharge.1,tag=!Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 5
    execute if entity @s[tag=Skill.Stamina.ShortCharge.1] run scoreboard players add @s Wpn.Gs.ChargeTimer 6
    execute if entity @s[tag=Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 7
    execute if score @s Wpn.Gs.ChargeTimer matches 170.. if score @s Wpn.Gs.ChargeCount matches ..0 run function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 340.. if score @s Wpn.Gs.ChargeCount matches ..1 run function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 510.. if score @s Wpn.Gs.ChargeCount matches ..2 run function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/up_charge_count

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength delta.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 3 run tp @s @s

# 演出
   execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..8 at @s run tp @s ~ ~ ~ ~-0.5 ~

# 遷移
    # 右クリックを離した場合、溜め斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/great_sword/type_normal/13_cross_charge/change_to_cross
