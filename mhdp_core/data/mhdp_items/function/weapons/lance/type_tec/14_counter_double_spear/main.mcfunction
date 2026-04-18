#> mhdp_items:weapons/lance/type_tec/14_counter_double_spear/main
#
# カウンター突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"カウンター２連突き"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 7 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 16 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_5
    execute if score @s Wpn.AnimationTimer matches 13 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_10
    execute if score @s Wpn.AnimationTimer matches 14 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_6
    execute if score @s Wpn.AnimationTimer matches 15 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_7
    execute if score @s Wpn.AnimationTimer matches 16 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_8
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_9
    execute if score @s Wpn.AnimationTimer matches 24 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/animation_4
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 7 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/attack_0
    execute if score @s Wpn.GeneralTimer matches 16 run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/attack_1

# 移動
    execute if score @s Wpn.GeneralTimer matches 5 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:4000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 7 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:1500, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 16 rotated ~ -15 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:false, IsAdjust:false}

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 6..7 at @s run tp @s ~ ~ ~ ~-1.5 ~-0.3

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..35 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..35 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..35 run function mhdp_items:core/buffering/c
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..35 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..35 run function mhdp_items:core/buffering/arts_main

# 遷移
     # 左クリック：突き1に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/lance/type_tec/1_spear_1/start
     # 右クリック：溜めに移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/lance/type_tec/4_charge/start
     # スニーク+ジャンプ：ガードダッシュに移行
        execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/lance/type_tec/7_guard_dash/start
    # ジャンプ：ステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/lance/type_tec/10_step/start

# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_tec/31_blade_dance/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_tec/30_upper_bash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 36.. run function mhdp_items:weapons/lance/type_tec/14_counter_double_spear/end
