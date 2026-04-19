#> mhdp_items:weapons/lance/type_tec/18_dash/main_jump
#
# 突進 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GeneralTimer matches 7.. run scoreboard players set @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# 演出
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/lance/type_tec/18_dash/animation_4
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/lance/type_tec/18_dash/animation_5

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/lance/type_tec/18_dash/attack
    execute if score @s Wpn.GeneralTimer matches 4 run function mhdp_items:weapons/lance/type_tec/18_dash/attack

# 移動
    execute if score @s Wpn.AnimationTimer matches 1 run tp @s @s
    execute if score @s Wpn.AnimationTimer matches 1 rotated ~ -40 run function api:weapon_operation/use_player_motion.m {Strength:6000, IsForce:true, IsAdjust:false}

# 移動制限
    execute if score @s Wpn.AnimationTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.AnimationTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 遷移
    # 着地：突進に移行
       execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.AnimationTimer matches 3.. run function mhdp_items:weapons/lance/type_tec/18_dash/change_to_main
