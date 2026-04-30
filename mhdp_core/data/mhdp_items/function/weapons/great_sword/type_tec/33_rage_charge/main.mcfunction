#> mhdp_items:weapons/great_sword/type_tec/33_rage_charge/main
#
# 震怒竜怨斬 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"震怒竜怨斬・溜め"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.9
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/animation_3
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/animation_4
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/animation_5
    execute if score @s Wpn.AnimationTimer matches 19 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/animation_6
    execute if score @s Wpn.AnimationTimer matches 24 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/animation_7

# 溜め
    execute if score @s Wpn.GeneralTimer matches 24.. if entity @s[tag=!Skill.Stamina.ShortCharge.1,tag=!Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 5
    execute if score @s Wpn.GeneralTimer matches 24.. if entity @s[tag=Skill.Stamina.ShortCharge.1] run scoreboard players add @s Wpn.Gs.ChargeTimer 6
    execute if score @s Wpn.GeneralTimer matches 24.. if entity @s[tag=Skill.Stamina.ShortCharge.2] run scoreboard players add @s Wpn.Gs.ChargeTimer 7
    execute if score @s Wpn.Gs.ChargeTimer matches ..200 run playsound block.beacon.activate master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 0.5 0.5
    execute if score @s Wpn.Gs.ChargeTimer matches 201..350 run playsound block.beacon.activate master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 0.5 0.7
    execute if score @s Wpn.Gs.ChargeTimer matches 351.. run playsound block.beacon.activate master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 0.5 0.9
    execute if score @s Wpn.Gs.ChargeTimer matches 150 run playsound block.beacon.activate master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s Wpn.Gs.ChargeTimer matches 300 run playsound block.beacon.activate master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.7
    execute if score @s Wpn.Gs.ChargeTimer matches 450 run playsound block.beacon.activate master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.9
    execute if score @s Wpn.Gs.ChargeTimer matches 150.. if score @s Wpn.Gs.ChargeCount matches ..0 rotated ~ -90 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 300.. if score @s Wpn.Gs.ChargeCount matches ..1 rotated ~ -90 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/up_charge_count
    execute if score @s Wpn.Gs.ChargeTimer matches 450.. if score @s Wpn.Gs.ChargeCount matches ..2 rotated ~ -90 run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/up_charge_count

# 溜め演出
    particle crimson_spore ~ ~1 ~ 0.7 1 0.7 0 1
    execute if score @s Wpn.Gs.ChargeTimer matches ..149 run particle dust{color:[1.000,1.000,0.820],scale:1.0} ~ ~1 ~ 0.7 1 0.7 1 1
    execute if score @s Wpn.Gs.ChargeTimer matches 150.. run particle dust{color:[1.000,0.812,0.490],scale:1.3} ~ ~1 ~ 0.8 1 0.8 1 1
    execute if score @s Wpn.Gs.ChargeTimer matches 300.. run particle dust{color:[0.949,0.663,0.447],scale:1.5} ~ ~1 ~ 0.9 1 0.9 1 1
    execute if score @s Wpn.Gs.ChargeTimer matches 450.. run particle dust{color:[0.710,0.208,0.208],scale:1.8} ~ ~1 ~ 1 1 1 1 1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:5000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:false, IsAdjust:false}

# アーマー
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.Armor.Hyper

# 遷移
    # 右クリックを離した場合、溜め斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 40.. run function mhdp_items:weapons/great_sword/type_tec/34_rage_attack/start
    # 溜めすぎた場合、自動的に溜め斬りに移行
        execute if score @s Wpn.Gs.ChargeTimer matches 600.. run function mhdp_items:weapons/great_sword/type_tec/34_rage_attack/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 1500.. run function mhdp_items:weapons/great_sword/type_tec/33_rage_charge/end
