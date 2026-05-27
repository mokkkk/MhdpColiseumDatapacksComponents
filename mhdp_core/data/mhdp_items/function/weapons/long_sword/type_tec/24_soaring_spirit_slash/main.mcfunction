#> mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/main
#
# 飛翔円月斬 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.soaring_spirit_slash"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.GeneralTimer matches 1 positioned ~ ~1.65 ~ run particle flash{color:[1.000,1.000,1.000,1.00]} ^ ^ ^1 0.2 0.2 0.2 0 1
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.armor.equip_chain master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.GeneralTimer matches 5 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/animation_0
    execute if score @s Wpn.AnimationTimer matches 2 run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/animation_1
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/animation_2
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/animation_3
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/animation_4
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/animation_5
    execute if score @s Wpn.GeneralTimer matches 5 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^1.2 rotated ~80 30 run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/particle
    execute if score @s Wpn.GeneralTimer matches 5 positioned ~ ~1.65 ~ positioned ^-0.3 ^ ^2.2 rotated ~80 30 run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/particle

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 5 run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/attack

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..3 run tp @s ~ ~ ~ ~0.5 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 7..8 run tp @s ~ ~ ~ ~-0.7 ~
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 9..10 run tp @s ~ ~ ~ ~-0.3 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_move_veryslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 着地判定
    execute if score @s Wpn.GeneralTimer matches 2 run tag @s add Ply.Ope.IsAir
    execute if entity @s[tag=!Ply.Ope.IsAir] if score @s Wpn.GeneralTimer matches 8..98 run scoreboard players set @s Wpn.GeneralTimer 99
    execute if score @s Wpn.GeneralTimer matches 99 run function mhdp_items:weapons/long_sword/type_tec/23_fall_thrust/effect_on_ground

# 遷移
    # ヒット時：飛翔円月斬・ジャンプに移行
        execute if entity @s[tag=Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 6.. run function mhdp_items:weapons/long_sword/type_tec/25_soaring_spirit_jump/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 105.. run function mhdp_items:weapons/long_sword/type_tec/24_soaring_spirit_slash/end
