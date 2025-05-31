#> mhdp_items:weapons/short_sword/type_tec/27_charge_spear/main_finish
#
# 溜め斬り落とし メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"溜め斬り落とし(フィニッシュ)"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 31 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 13 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_5
    execute if score @s Wpn.AnimationTimer matches 25 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_6
    execute if score @s Wpn.AnimationTimer matches 30 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_7
    execute if score @s Wpn.AnimationTimer matches 32 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_8
    execute if score @s Wpn.AnimationTimer matches 34 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/animation_9
    execute if score @s Wpn.AnimationTimer matches 31 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/particle
    execute if score @s Wpn.AnimationTimer matches 31 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/particle
    execute if score @s Wpn.AnimationTimer matches 31 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/particle

# 演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound block.enchantment_table.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 1.. run particle crimson_spore ~ ~0.1 ~ 0.4 0.1 0.4 0 3
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 at @s run tp @s ~ ~ ~ ~1 ~1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 4..10 at @s run tp @s ~ ~ ~ ~0.6 ~0.8
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 25..26 at @s run tp @s ~ ~ ~ ~-2 ~-2
    execute if score @s Wpn.GeneralTimer matches 20 run playsound entity.experience_orb.pickup master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 20 positioned ~ ~1.65 ~ run particle flash ^ ^ ^0.5 0 0 0 0 1
    execute if score @s Wpn.AnimationTimer matches 25..27 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 25 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 10

# 攻撃
    execute if entity @s[tag=!Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 25..30 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/attack_move_finish
    execute if entity @s[tag=Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 31 run tag @s remove Ply.Flag.Hit
    execute if score @s Wpn.GeneralTimer matches 32 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/attack_finish

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 2 run scoreboard players set $strength player_motion.api.launch 6000
    execute if score @s Wpn.GeneralTimer matches 2 rotated ~180 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 5 run scoreboard players set $strength player_motion.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 5 rotated ~180 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 25 run scoreboard players set $strength player_motion.api.launch 10000
    execute if score @s Wpn.GeneralTimer matches 25 rotated ~ -30 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 31 run scoreboard players set $strength player_motion.api.launch 8000
    execute if score @s Wpn.GeneralTimer matches 31 rotated ~ 60 run function player_motion:api/launch_looking

# # 先行入力
#     execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short,tag=!Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..11 run function mhdp_items:core/buffering/a
#     execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long,tag=!Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..11 run function mhdp_items:core/buffering/b
#     execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..11 run function mhdp_items:core/buffering/c
#     execute if entity @s[tag=Ply.Ope.StartDoubleJump] if score @s Wpn.GeneralTimer matches 3..11 run function mhdp_items:core/buffering/jump

# 遷移
# ヒット時
        execute if entity @s[tag=Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 32 run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/change_to_hit_finish
#     # 右クリック短押し：通常コンボ1に移行
#         execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_tec/1_normal_1/start
#     # 右クリック長押し：水平斬りコンボ1に移行
#         execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_tec/4_horizon_1/start
#     # スニーク+右クリック：盾攻撃に移行
#         execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/start
#     # ジャンプ回避
#         execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/util/move_jump
   
# 終了
    execute if score @s Wpn.GeneralTimer matches 45.. run function mhdp_items:weapons/short_sword/type_tec/27_charge_spear/end
