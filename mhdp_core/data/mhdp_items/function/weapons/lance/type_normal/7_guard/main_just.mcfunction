#> mhdp_items:weapons/lance/type_normal/7_guard/main_just
#
# ジャストガード メイン処理
#
# @within function mhdp_items:weapons/short_sword/type_normal/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"weapon.lance.action.guard_just"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/lance/type_normal/7_guard/animation_0
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/lance/type_normal/7_guard/animation_1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint] if score @s Wpn.GeneralTimer matches 1..19 run function mhdp_items:core/buffering/jump
    execute if score @s Wpn.GeneralTimer matches 1..19 run function mhdp_items:core/buffering/arts_main

# 狩技遷移
    execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 1.. run function mhdp_items:weapons/lance/type_normal/22_guard_rage/start
    execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 1.. run function mhdp_items:weapons/lance/type_normal/24_screw_thrust/start

# 遷移
    # 左クリック：突きに移行
        execute if entity @s[tag=Ply.Ope.StartLeftClick] run function mhdp_items:weapons/lance/type_normal/7_guard/change_to_spear
    # 右クリック：突きに移行
        execute if entity @s[tag=Ply.Ope.IsUsingEnderEye] run function mhdp_items:weapons/lance/type_normal/7_guard/change_to_charge_counter_just
    # スニーク：ガードに移行
        execute if entity @s[tag=Wpn.Lc.Tec.Guard.Just,tag=Ply.Ope.StartSneak] run function mhdp_items:weapons/lance/type_normal/7_guard/change_to_guard
    # ステップ
        execute if entity @s[tag=Wpn.Lc.Tec.Guard.Just,tag=Ply.Ope.Buffering.Jump] run function mhdp_items:weapons/lance/type_normal/10_step/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/lance/type_normal/7_guard/end_just
