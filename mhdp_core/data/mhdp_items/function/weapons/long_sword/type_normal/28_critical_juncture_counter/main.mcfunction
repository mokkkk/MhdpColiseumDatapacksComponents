#> mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/main
#
# 鏡花の構え・カウンター メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.critical_juncture_counter"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.armor.equip_chain master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.GeneralTimer matches 5 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 5 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 5 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/animation_2
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/animation_3
    execute if score @s Wpn.GeneralTimer matches 5 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -80 run function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/particle
    execute if score @s Wpn.GeneralTimer matches 5 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^2.2 rotated ~80 -80 run function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 4 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:2500, IsForce:false, IsAdjust:false}

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 11 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..17 run function mhdp_items:core/buffering/jump

# 遷移
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/long_sword/util/move_jump

# 終了
    execute if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/long_sword/type_normal/28_critical_juncture_counter/end
