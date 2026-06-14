#> mhdp_items:weapons/long_sword/type_normal/3_normal_3/main
#
# 通常攻撃3 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.normal_attack_3"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 5 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_normal/3_normal_3/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/long_sword/type_normal/3_normal_3/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/long_sword/type_normal/3_normal_3/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/long_sword/type_normal/3_normal_3/animation_3
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/long_sword/type_normal/3_normal_3/animation_4
    execute if score @s Wpn.GeneralTimer matches 5 positioned ~ ~1.65 ~ positioned ^-0.5 ^-0.3 ^1.2 rotated ~90 40 run function mhdp_items:weapons/long_sword/type_normal/3_normal_3/particle
    execute if score @s Wpn.GeneralTimer matches 5 positioned ~ ~1.65 ~ positioned ^-0.5 ^-0.3 ^2.2 rotated ~90 40 run function mhdp_items:weapons/long_sword/type_normal/3_normal_3/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/long_sword/type_normal/3_normal_3/attack

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_nojump
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint,tag=!Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 3..15 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 3..15 run function mhdp_items:core/buffering/arts_main

# 遷移
    # ジャンプ回避
        execute if entity @s[tag=Ply.Ope.Buffering.Jump] if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/long_sword/util/move_jump

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/long_sword/type_normal/27_critical_juncture/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/long_sword/type_normal/26_sakura_slash/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/long_sword/type_normal/3_normal_3/end
