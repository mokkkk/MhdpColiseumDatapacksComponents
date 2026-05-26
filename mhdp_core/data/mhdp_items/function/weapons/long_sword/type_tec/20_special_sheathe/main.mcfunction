#> mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/main
#
# 特殊納刀 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.special_sheathe"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.armor.equip_chain master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.GeneralTimer matches 47 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.7
    execute if score @s Wpn.GeneralTimer matches 47 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/animation_0
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/animation_1
    execute if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/animation_2
    execute if score @s Wpn.GeneralTimer matches 7 run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/animation_3
    execute if score @s Wpn.GeneralTimer matches 17 run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/animation_4
    execute if score @s Wpn.GeneralTimer matches 27 run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/animation_5
    execute if score @s Wpn.GeneralTimer matches 37 run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/animation_6
    execute if score @s Wpn.GeneralTimer matches 47 run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/animation_7
    execute if score @s Wpn.GeneralTimer matches 48 run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/animation_8
    execute if score @s Wpn.GeneralTimer matches 50 run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/animation_7

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 遷移
    # 左クリック：居合抜刀斬りに移行
        execute if entity @s[tag=Ply.Ope.StartLeftClick] if score @s Wpn.GeneralTimer matches 51.. run function mhdp_items:weapons/long_sword/type_tec/21_iai_slash/start
    # 右クリック：気刃斬り1に移行
        # execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 51.. run function mhdp_items:weapons/long_sword/type_tec/4_spirit_slash_1/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.IsKeyJump] if score @s Wpn.GeneralTimer matches 51.. run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/cancel_jump
# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/22_guard_rage/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/type_tec/24_screw_thrust/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 400.. run function mhdp_items:weapons/long_sword/type_tec/20_special_sheathe/end
