#> mhdp_items:weapons/great_sword/type_tec/16_cross_move/main
#
# 溜め メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"追撃十字斬り・移動"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound item.armor.equip_iron master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s Wpn.AnimationTimer matches ..2 run function mhdp_items:weapons/great_sword/type_tec/16_cross_move/animation_0
    playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    particle block{block_state:"minecraft:sand"} ^ ^0.1 ^ 0.2 0.2 0.2 0 2

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1..2 run scoreboard players set $strength player_motion.api.launch 7000
    execute if score @s Wpn.GeneralTimer matches 1..2 rotated ~ 0 run function player_motion:api/launch_looking
    execute if score @s Wpn.GeneralTimer matches 3..30 run scoreboard players set $strength player_motion.api.launch 2000
    execute if score @s Wpn.GeneralTimer matches 3..30 rotated ~ 0 run function player_motion:api/launch_looking

# 遷移
    # 右クリック離す：十字斬りに移行
        execute if entity @s[tag=!Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 5.. run function mhdp_items:weapons/great_sword/type_tec/16_cross_move/change_to_cross
        execute if score @s Wpn.GeneralTimer matches 30.. run function mhdp_items:weapons/great_sword/type_tec/16_cross_move/change_to_cross
