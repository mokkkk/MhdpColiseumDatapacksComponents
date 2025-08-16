#> mhdp_items:weapons/great_sword/type_normal/17_power_sheathe/main
#
# 強化納刀 メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"強化納刀"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# 無敵時間設定
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set @s Ply.Timer.Avoid 6

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.9
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/great_sword/type_normal/17_power_sheathe/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/great_sword/type_normal/17_power_sheathe/animation_1
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/great_sword/type_normal/17_power_sheathe/animation_2
    execute if score @s Wpn.AnimationTimer matches 7 run function mhdp_items:weapons/great_sword/type_normal/17_power_sheathe/animation_3

# 演出
    execute if score @s Wpn.AnimationTimer matches 4..15 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s Wpn.AnimationTimer matches 4..10 run particle block{block_state:"minecraft:sand"} ^ ^0.1 ^ 0.2 0.2 0.2 0 2
    execute if score @s Wpn.AnimationTimer matches 4..10 run particle end_rod ^ ^1 ^ 0.2 0.2 0.2 0.05 2

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 4 run scoreboard players set $strength player_motion.api.launch 15000
    execute if score @s Wpn.GeneralTimer matches 4 rotated ~ 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 6 run scoreboard players set $strength player_motion.api.launch 15000
    execute if score @s Wpn.GeneralTimer matches 6 rotated ~ 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 8 run scoreboard players set $strength player_motion.api.launch 15000
    execute if score @s Wpn.GeneralTimer matches 8 rotated ~ 0 run function player_motion:api/launch_looking

# 終了
    execute if score @s Wpn.GeneralTimer matches 14.. run function mhdp_items:weapons/great_sword/type_normal/17_power_sheathe/end
