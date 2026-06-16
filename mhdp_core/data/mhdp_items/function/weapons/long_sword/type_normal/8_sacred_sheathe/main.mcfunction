#> mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/main
#
# 威合 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.sacred_sheathe"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.armor.equip_chain master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.GeneralTimer matches 47 run playsound item.axe.scrape master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.7
    execute if score @s Wpn.GeneralTimer matches 47 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/animation_0
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/animation_1
    execute if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/animation_2
    execute if score @s Wpn.GeneralTimer matches 7 run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/animation_3
    execute if score @s Wpn.GeneralTimer matches 17 run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/animation_4
    execute if score @s Wpn.GeneralTimer matches 27 run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/animation_5
    execute if score @s Wpn.GeneralTimer matches 37 run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/animation_6
    execute if score @s Wpn.GeneralTimer matches 47 run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/animation_7
    execute if score @s Wpn.GeneralTimer matches 48 run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/animation_8
    execute if score @s Wpn.GeneralTimer matches 50 run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/animation_7

# ゲージ消費
    execute unless entity @s[tag=Ply.Flag.Ls.SacredCharge] if score @s Wpn.GeneralTimer matches 47.. if score @s Wpn.Ls.SpiritLevelGauge matches 1.. run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/charge

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}

# ステップ移動
    execute if entity @s[tag=Ply.Ope.StartKeyJump] if score @s Wpn.GeneralTimer matches 51.. run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 51.. if score @s Wpn.AnimationTimer matches 10.. if score @s Ply.Stats.Stamina matches 150.. run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/move

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 遷移
    # 右クリック解除：威合抜刀斬り または 気刃解放斬りに遷移
        execute if entity @s[tag=!Ply.Flag.Ls.SacredCharge,tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 5.. run function mhdp_items:weapons/long_sword/type_normal/9_sacred_slash/start
        execute if entity @s[tag=Ply.Flag.Ls.SacredCharge,tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 5.. run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 1200.. run function mhdp_items:weapons/long_sword/type_normal/8_sacred_sheathe/end
