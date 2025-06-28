#> mhdp_items:weapons/bow/type_tec/10_flying_shot/main
#
# 飛翔睨み撃ち メイン処理
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"身躱し射法"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if entity @s[tag=!Ply.Weapon.HisStop] run scoreboard players add @s Wpn.AnimationTimer 1

# アニメーション演出
    execute if score @s Wpn.AnimationTimer matches 1..5 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.AnimationTimer matches 1..7 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.3 0.1 0.3 0 3
    execute if score @s Wpn.AnimationTimer matches 1 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/animation_0
    execute if score @s Wpn.AnimationTimer matches 3 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/animation_1
    execute if score @s Wpn.AnimationTimer matches 4 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/animation_2
    execute if score @s Wpn.AnimationTimer matches 5 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/animation_3
    execute if score @s Wpn.AnimationTimer matches 6 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/animation_4
    execute if score @s Wpn.AnimationTimer matches 11 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/animation_5
    execute if score @s Wpn.AnimationTimer matches 12 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/animation_6
    execute if score @s Wpn.AnimationTimer matches 13 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/animation_7

# 攻撃
    execute if score @s Wpn.GeneralTimer matches 3 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_tec/10_flying_shot/attack
    execute if score @s Wpn.GeneralTimer matches 11 positioned ~ ~1.65 ~ run function mhdp_items:weapons/bow/type_tec/10_flying_shot/attack

# 演出
    execute if entity @s[tag=Ply.Ope.IsKeyRight,tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..7 run tp @s ~ ~ ~ ~-1.5 ~
    execute if entity @s[tag=Ply.Ope.IsKeyLeft,tag=!Ply.Option.DisableCameraEffect] if score @s Wpn.GeneralTimer matches 3..7 run tp @s ~ ~ ~ ~1.5 ~

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 移動
    execute if score @s Wpn.GeneralTimer matches 1 rotated ~ -40 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/move
    execute if score @s Wpn.GeneralTimer matches 5 rotated ~ -15 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/move
    execute if score @s Wpn.GeneralTimer matches 8 rotated ~ 15 run function mhdp_items:weapons/bow/type_tec/11_moving_shot/move

# 遷移
    # 右クリック押し続け：溜めに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/bow/type_tec/1_charge/start_from_movingshot

# 終了
    execute if entity @s[tag=!Wpn.Bw.Tec.Charge] if score @s Wpn.GeneralTimer matches 15.. run function mhdp_items:weapons/bow/type_tec/11_moving_shot/end
