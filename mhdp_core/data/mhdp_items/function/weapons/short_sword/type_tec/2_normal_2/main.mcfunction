#> mhdp_items:weapons/short_sword/type_tec/2_normal_2/main
#
# 通常コンボ2 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"通常コンボ・２"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/animation_3
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/particle
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 run tp @s ~ ~ ~ ~-0.6 ~-0.7
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..5 run tp @s ~ ~ ~ ~1 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 9 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 9 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 先行入力
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Short,tag=!Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..15 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long,tag=!Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..15 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..15 run function mhdp_items:core/buffering/c
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..15 run function mhdp_items:core/buffering/d

# 遷移
     # スニーク+ジャンプ時：バックステップに移行
        execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.StartJump] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/change_to_backstep
    # 右クリック短押し：通常コンボ3に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/change_to_normal_3
    # 右クリック長押し：水平斬りコンボ1に移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/change_to_horizon_1
    # スニーク+右クリック：盾攻撃に移行
        execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/change_to_bash
    # 同時押し：回転斬りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.D] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/change_to_spin

# 終了
    execute if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/short_sword/type_tec/2_normal_2/end
