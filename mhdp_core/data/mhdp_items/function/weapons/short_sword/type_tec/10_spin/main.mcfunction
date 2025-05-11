#> mhdp_items:weapons/short_sword/type_tec/10_spin/main
#
# 回転斬り メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"回転斬り"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 8 run playsound entity.player.attack.sweep master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1..3 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_5
    execute if score @s Wpn.AnimationTimer matches 4..5 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_6
    execute if score @s Wpn.AnimationTimer matches 6..7 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_7
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_0
    execute if score @s Wpn.AnimationTimer matches 9 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_1
    execute if score @s Wpn.AnimationTimer matches 10 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_2
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_3
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/short_sword/type_tec/10_spin/animation_4
    execute if score @s Wpn.AnimationTimer matches 8 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/short_sword/type_tec/10_spin/particle
    execute if score @s Wpn.AnimationTimer matches 8 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/short_sword/type_tec/10_spin/particle
    execute if score @s Wpn.AnimationTimer matches 8 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/short_sword/type_tec/10_spin/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 8 run function mhdp_items:weapons/short_sword/type_tec/10_spin/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 run tp @s ~ ~ ~ ~-2.2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 9..11 run tp @s ~ ~ ~ ~2 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 12..13 run tp @s ~ ~ ~ ~0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run effect give @s slowness 1 3 true
    execute if score @s Wpn.GeneralTimer matches 10 run attribute @s jump_strength modifier remove mhdp_core:weapon_jump_strength
    execute if score @s Wpn.GeneralTimer matches 10 run attribute @s jump_strength modifier add mhdp_core:weapon_jump_strength -0.35 add_value

# 移動
    execute if score @s Wpn.GeneralTimer matches 5 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 5 run scoreboard players set $strength delta.api.launch 2000
    execute if score @s Wpn.GeneralTimer matches 5 rotated ~ 0 run function delta:api/launch_looking

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartUsingEnderEye] if score @s Wpn.GeneralTimer matches 3..25 run function mhdp_items:core/buffering/a

# 遷移
    # スニーク+ジャンプ時：バックステップに移行
        execute if entity @s[tag=Ply.Ope.IsSneaking,tag=Ply.Ope.StartJump] if score @s Wpn.GeneralTimer matches 9.. run function mhdp_items:weapons/short_sword/type_tec/10_spin/change_to_backstep
    # 右クリック短押し：通常コンボ1に移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 13.. run function mhdp_items:weapons/short_sword/type_tec/10_spin/change_to_normal_1

# 終了
    execute if score @s Wpn.GeneralTimer matches 26.. run function mhdp_items:weapons/short_sword/type_tec/10_spin/end
