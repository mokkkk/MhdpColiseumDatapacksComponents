#> mhdp_items:weapons/lance/type_tec/10_step/main
#
# ステップ メイン処理
#
# @within function mhdp_items:weapons/lance/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ステップ"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s Wpn.GeneralTimer matches 1..5 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 0.3 0.1 0.3 0 3
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/lance/type_tec/10_step/animation_0

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 狩技遷移
    # execute if score @s Wpn.GeneralTimer matches 3.. run function mhdp_items:core/buffering/arts_main
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 3.. run function mhdp_items:weapons/lance/type_tec/31_blade_dance/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 3.. run function mhdp_items:weapons/lance/type_tec/30_upper_bash/start

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartLeftClick] if score @s Wpn.GeneralTimer matches 1..11 run function mhdp_items:core/buffering/a

# 遷移
    # 左クリック：突きに移行
        execute if entity @s[tag=Ply.Ope.Buffering.A] if score @s Wpn.GeneralTimer matches 10.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/lance/type_tec/1_spear_1/start
    # スニーク：ガードに移行
        execute if entity @s[tag=Ply.Ope.IsSneaking] if score @s Wpn.GeneralTimer matches 10.. unless score @s Wpn.GuardStopTimer matches 1.. run function mhdp_items:weapons/lance/type_tec/7_guard_dash/change_to_guard

# 終了
    execute if score @s Wpn.GeneralTimer matches 12.. run function mhdp_items:weapons/lance/type_tec/10_step/end
