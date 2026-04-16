#> mhdp_items:weapons/lance/type_tec/3_spear_3/main
#
# 突き3 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"突き・３"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# キー入力時、移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function api:weapon_operation/vector_move_before.m {Strength:4000}
    execute if score @s Wpn.GeneralTimer matches 4 rotated ~ 0 run function api:weapon_operation/vector_move_before.m {Strength:4000}

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 4 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/3_spear_3/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/lance/type_tec/3_spear_3/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/lance/type_tec/3_spear_3/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/lance/type_tec/1_spear_1/animation_3
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/lance/type_tec/1_spear_1/animation_4
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_tec/3_spear_3/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_tec/3_spear_3/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_tec/3_spear_3/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/lance/type_tec/3_spear_3/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 4 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:3000, IsForce:false, IsAdjust:false}

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 12 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick] if score @s Wpn.GeneralTimer matches 3..21 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..21 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..21 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..21 run function mhdp_items:core/buffering/arts_main

# 遷移
    # 左クリック：3連突きに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/lance/type_tec/9_triple_spear/start
    # スニーク+ジャンプ：ガードダッシュに移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/lance/type_tec/7_guard_dash/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/lance/util/move_jump

# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_tec/31_blade_dance/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/lance/type_tec/30_upper_bash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 22.. run function mhdp_items:weapons/lance/type_tec/3_spear_3/end
