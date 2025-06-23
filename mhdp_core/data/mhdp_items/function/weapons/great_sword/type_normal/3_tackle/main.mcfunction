#> mhdp_items:weapons/great_sword/type_normal/3_tackle/main
#
# タックル メイン処理
#
# @within function mhdp_items:weapons/great_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"タックル"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/great_sword/type_normal/3_tackle/animation_0
    execute if score @s Wpn.AnimationTimer matches 1..4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s Wpn.AnimationTimer matches 1..4 run particle block{block_state:"minecraft:sand"} ^ ^0.1 ^ 0.2 0.2 0.2 0 2

# 攻撃
    execute if entity @s[tag=!Ply.Flag.Hit] if score @s Wpn.GeneralTimer matches 1..4 run function mhdp_items:weapons/great_sword/type_normal/3_tackle/attack

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 run tp @s @s
    execute if score @s Wpn.GeneralTimer matches 1 run scoreboard players set $strength player_motion.api.launch 4000
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ 0 run function player_motion:api/launch_looking

# 演出
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 1..2 run tp @s ~ ~ ~ ~ ~1
    execute if entity @s[tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 15..16 run tp @s ~ ~ ~ ~ ~-1

# アーマー
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.Armor.Hyper
    execute if score @s Wpn.GeneralTimer matches 12 run tag @s remove Ply.Weapon.Armor.Hyper

# 抜刀攻撃終了
    execute if score @s Wpn.GeneralTimer matches 5 run tag @s remove Ply.Flag.DrawAttack
    execute if score @s Wpn.GeneralTimer matches 5 run tag @s remove Ply.Flag.Hit

# 遷移
    # 右クリック中の場合、溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 16.. run function mhdp_items:weapons/great_sword/type_normal/3_tackle/change_to_charge

# 終了
    execute if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/great_sword/type_normal/3_tackle/end
