#> mhdp_items:weapons/short_sword/type_tec/26_guard_slash/main
#
# ガード斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ガード斬り"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# キー入力時、移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function api:weapon_operation/vector_move_before.m {Strength:4000}

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/animation_1
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/attack

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# ガード判定
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.Guard
    execute if score @s Wpn.GeneralTimer matches 7 run tag @s remove Ply.Weapon.Guard

# 先行入力
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short,tag=!Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..11 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long,tag=!Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..11 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=Ply.Ope.IsKeyForward,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..11 run function mhdp_items:core/buffering/c
    execute if entity @s[tag=Ply.Ope.StartDoubleJump] if score @s Wpn.GeneralTimer matches 3..11 run function mhdp_items:core/buffering/jump

# 遷移
    # 右クリック短押し：通常コンボ1に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_tec/1_normal_1/start
    # 右クリック長押し：水平斬りコンボ1に移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_tec/4_horizon_1/start
    # スニーク+右クリック：盾攻撃に移行
        execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/type_tec/7_bash_1/start
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 7.. run function mhdp_items:weapons/short_sword/util/move_jump
   
# 終了
    execute if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/short_sword/type_tec/26_guard_slash/end
