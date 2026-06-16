#> mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/main
#
# 踏み込み気刃斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.sacred_release_slash"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.armor.equip_chain master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.GeneralTimer matches 4 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 4 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s Wpn.GeneralTimer matches 11 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 11 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.1
    execute if score @s Wpn.GeneralTimer matches 22 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.GeneralTimer matches 22 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 22 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_5
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_6
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_7
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 20 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_8
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_9
    execute if score @s Wpn.AnimationTimer matches 22 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_10
    execute if score @s Wpn.AnimationTimer matches 23 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/animation_11
    execute if score @s Wpn.GeneralTimer matches 4 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -10 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/particle
    execute if score @s Wpn.GeneralTimer matches 11 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 -40 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/particle
    execute if score @s Wpn.GeneralTimer matches 22 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~90 -90 run function mhdp_items:weapons/long_sword/type_normal/6_spirit_slash_3/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/attack_0
    execute if score @s Wpn.GeneralTimer matches 11 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/attack_1
    execute if score @s Wpn.GeneralTimer matches 22 run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/attack_2

# 移動
    execute if score @s Wpn.GeneralTimer matches 3 at @s rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:5000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 10 at @s rotated ~ -70 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:false, IsAdjust:false}
    execute if entity @s[tag=Ply.Weapon.HisStop] run tp @s @s

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 22 run function api:weapon_operation/attribute_move_veryslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..34 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..34 run function mhdp_items:core/buffering/arts_main

# アーマー
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.Armor.Hyper
    execute if score @s Wpn.GeneralTimer matches 25 run tag @s remove Ply.Weapon.Armor.Hyper

# 遷移
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 32.. run function mhdp_items:weapons/long_sword/util/move_jump

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 32.. run function mhdp_items:weapons/long_sword/type_normal/27_critical_juncture/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 32.. run function mhdp_items:weapons/long_sword/type_normal/26_sakura_slash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 35.. run function mhdp_items:weapons/long_sword/type_normal/10_sacred_release_slash/end
