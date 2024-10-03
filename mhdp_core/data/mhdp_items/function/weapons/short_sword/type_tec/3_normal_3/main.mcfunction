#> mhdp_items:weapons/short_sword/type_tec/3_normal_3/main
#
# 通常コンボ3・剣盾コンボ メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 10 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1..3 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_0
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_2
    execute if score @s Wpn.AnimationTimer matches 6..7 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_3
    execute if score @s Wpn.AnimationTimer matches 8..9 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_4
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_5
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_6
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/animation_7
    execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/particle_shield
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/particle_sword
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/particle_sword
    execute if score @s Wpn.AnimationTimer matches 10 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/particle_sword

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/attack_1
    execute if score @s Wpn.GeneralTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/attack_2

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~-1 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 4..7 run tp @s ~ ~ ~ ~0.8 ~-0.5
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 8..13 run tp @s ~ ~ ~ ~-0.3 ~0.8

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 16 run attribute @s generic.jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 16 run attribute @s generic.jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 移動
    execute if score @s Wpn.GeneralTimer matches 3 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 3 run scoreboard players set $strength delta.api.launch 1000
    execute if score @s Wpn.GeneralTimer matches 3 rotated ~ 0 run function delta:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 10 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 10 run scoreboard players set $strength delta.api.launch 1500
    execute if score @s Wpn.GeneralTimer matches 10 rotated ~ 0 run function delta:api/launch_looking

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye,tag=Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..24 run function mhdp_items:core/buffering/a
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..24 run function mhdp_items:core/buffering/b
    execute if entity @s[tag=Ply.Ope.UsedEnderEye.Long,tag=!Ply.Ope.IsSneaking,tag=!Ply.Ope.StartUsingEnderEye.WithSneak] if score @s Wpn.GeneralTimer matches 3..24 run function mhdp_items:core/buffering/c

# 遷移
    # 右クリック長押し：水平斬り1に移行
        execute if entity @s[tag=Ply.Ope.Buffering.C] if score @s Wpn.GeneralTimer matches 18.. run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/change_to_horizon_1
    # スニーク+ジャンプ時：バックステップに移行
        execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.StartJump] if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/change_to_backstep
    # スニーク+右クリック：盾攻撃に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/change_to_bash
    # 同時押し：旋刈りに移行
        execute if entity @s[tag=Ply.Ope.Buffering.B] if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/change_to_tsumuji

# 終了
    execute if score @s Wpn.GeneralTimer matches 25.. run function mhdp_items:weapons/short_sword/type_tec/3_normal_3/end
