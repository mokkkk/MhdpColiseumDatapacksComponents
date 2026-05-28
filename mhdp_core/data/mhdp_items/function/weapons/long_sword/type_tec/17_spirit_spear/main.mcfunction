#> mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/main
#
# 気刃突き メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.long_sword.action.spirit_spear"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound item.trident.return master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 2
    execute if score @s Wpn.AnimationTimer matches 17 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.3
    execute if score @s Wpn.GeneralTimer matches 14..16 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 14..17 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.3 0.1 0.3 0 3
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/animation_0
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/animation_1
    execute if score @s Wpn.AnimationTimer matches 16 run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/animation_2
    execute if score @s Wpn.AnimationTimer matches 17 run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/animation_3
    execute if score @s Wpn.AnimationTimer matches 18 run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/animation_4
    execute if score @s Wpn.AnimationTimer matches 21 run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/animation_5

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 17 run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/attack

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:2000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 4 rotated ~180 0 run function api:weapon_operation/use_player_motion.m {Strength:2000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 14 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:12000, IsForce:false, IsAdjust:false}
    execute if score @s Wpn.GeneralTimer matches 16 rotated ~ 0 run function api:weapon_operation/use_player_motion.m {Strength:8000, IsForce:false, IsAdjust:false}

# 演出

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 25 run function api:weapon_operation/attribute_moveslow
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 遷移
    # ヒット時：気刃兜割に移行
        execute if entity @s[tag=Ply.Flag.Hit] if score @s Wpn.Ls.SpiritLevel matches 1.. if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/long_sword/type_tec/18_helmbreaker/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 35.. run function mhdp_items:weapons/long_sword/type_tec/17_spirit_spear/end
