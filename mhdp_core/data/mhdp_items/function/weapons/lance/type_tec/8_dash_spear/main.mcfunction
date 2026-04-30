#> mhdp_items:weapons/lance/type_tec/8_dash_spear/main
#
# 飛び込み突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"飛び込み突き"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 1 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.4 0.1 0.4 0 10
    execute if score @s Wpn.AnimationTimer matches 9 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 13 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/animation_5
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 9 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/attack
    execute if score @s Wpn.GeneralTimer matches 11 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/attack_pursuit
    execute if score @s Wpn.GeneralTimer matches 13 run function mhdp_items:weapons/lance/type_tec/8_dash_spear/attack_pursuit

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ -15 run function api:weapon_operation/use_player_motion.m {Strength:9000, IsForce:true, IsAdjust:true}

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 18 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.IsUsingEnderEye,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/c
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/d
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/arts_main

# 遷移
     # 左クリック：突き2に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 19.. run function mhdp_items:weapons/lance/type_tec/2_spear_2/start
     # 右クリック：溜めに移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 19.. run function mhdp_items:weapons/lance/type_tec/4_charge/start
     # スニーク+ジャンプ：ガードダッシュに移行
        execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 19.. run function mhdp_items:weapons/lance/type_tec/7_guard_dash/start
    # スニーク+右クリック：溜めに移行
        execute if entity @s[tag=Ply.Ope.Buffering.D] if score @s Wpn.GeneralTimer matches 19.. run function mhdp_items:weapons/lance/type_tec/11_charge_counter/start
    # ジャンプ：ステップに移行
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 19.. run function mhdp_items:weapons/lance/type_tec/10_step/start

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 19.. run function mhdp_items:weapons/lance/type_tec/22_guard_rage/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 19.. run function mhdp_items:weapons/lance/type_tec/24_screw_thrust/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 26.. run function mhdp_items:weapons/lance/type_tec/8_dash_spear/end
