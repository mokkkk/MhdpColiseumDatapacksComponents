#> mhdp_items:weapons/lance/type_normal/21_spiral_thrust/main
#
# 流転突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"流転突き"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 5 run playsound item.spear.lunge_1 master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/animation_0
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/animation_1
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/animation_2
    execute if score @s Wpn.AnimationTimer matches 8 run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/animation_3
    execute if score @s Wpn.GeneralTimer matches 100 run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/animation_4
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.2 run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^1.7 run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/particle
    # execute if score @s Wpn.AnimationTimer matches 2 positioned ~ ~1.65 ~ positioned ^ ^ ^2.2 run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/particle

# 攻撃
    execute if entity @s[tag=!Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 5..99 run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/attack
    execute if entity @s[tag=!Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 100 run tag @s remove Ply.Flag.Hit

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 5 at @s rotated ~ ~ run function api:weapon_operation/use_player_motion.m {Strength:12000, IsForce:true, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 8 at @s rotated ~ ~ run function api:weapon_operation/use_player_motion.m {Strength:12000, IsForce:true, IsAdjust:false}
# 空中フラグ有効
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Ope.IsAir
# 一時的に無重力化
    execute if score @s Wpn.GeneralTimer matches 1 run attribute @s gravity modifier add mhdp_core:weapon_gravity -0.08 add_value
    execute if score @s Wpn.GeneralTimer matches 8 run attribute @s gravity modifier remove mhdp_core:weapon_gravity
    execute if score @s Wpn.GeneralTimer matches 100 run attribute @s gravity modifier remove mhdp_core:weapon_gravity

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 着地判定
    execute if score @s Wpn.GeneralTimer matches 3 run tag @s add Ply.Ope.IsAir
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 8..98 run scoreboard players set @s Wpn.GeneralTimer 99

# 先行入力
    execute if score @s Wpn.GeneralTimer matches 3..109 run function mhdp_items:core/buffering/arts_main

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 104..109 run function mhdp_items:weapons/lance/type_normal/22_guard_rage/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 104..109 run function mhdp_items:weapons/lance/type_normal/24_screw_thrust/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 110.. run function mhdp_items:weapons/lance/type_normal/21_spiral_thrust/end
