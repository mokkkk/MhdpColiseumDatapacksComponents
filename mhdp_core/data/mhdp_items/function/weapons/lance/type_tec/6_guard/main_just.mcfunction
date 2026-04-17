#> mhdp_items:weapons/lance/type_tec/6_guard/main_just
#
# ジャストガード メイン処理
#
# @within function mhdp_items:weapons/short_sword/type_tec/main

# 操作表示
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:core/util/item_modify_custom_name {Name:"ジャストガード"}

# タイマー増加
    scoreboard players add @s Wpn.GeneralTimer 1
    execute if score @s Wpn.GuardStopTimer matches 1.. run scoreboard players remove @s Wpn.GuardStopTimer 1

# アニメーション演出
    execute if score @s Wpn.GeneralTimer matches 1 run function mhdp_items:weapons/lance/type_tec/6_guard/animation_0
    execute if score @s Wpn.GeneralTimer matches 3 run function mhdp_items:weapons/lance/type_tec/6_guard/animation_1

# 移動制限
    execute if score @s Wpn.GeneralTimer matches 1 run function api:weapon_operation/attribute_movestop
    execute if score @s Wpn.GeneralTimer matches 1 run tag @s add Ply.Weapon.NoMoveJump

# 先行入力
    # execute if entity @s[tag=Ply.Ope.StartKeyJump,tag=!Ply.Ope.IsKeySprint] if score @s Wpn.GeneralTimer matches 1..19 run function mhdp_items:core/buffering/jump
    # execute if score @s Wpn.GeneralTimer matches 1..19 run function mhdp_items:core/buffering/arts_main

# 狩技遷移
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts1] if score @s Wpn.GeneralTimer matches 1..19 run function mhdp_items:weapons/short_sword/type_tec/31_blade_dance/start
    # execute if entity @s[tag=Ply.Ope.Buffering.Arts2] if score @s Wpn.GeneralTimer matches 1..19 run function mhdp_items:weapons/short_sword/type_tec/30_upper_bash/start

# 遷移
    # 左右クリック：渾身返し突きに移行
        execute if entity @s[tag=Wpn.Lc.Tec.Guard.Just,tag=Ply.Ope.StartLeftClick] run function mhdp_items:weapons/lance/type_tec/6_guard/change_to_counter
        execute if entity @s[tag=Wpn.Lc.Tec.Guard.Just,tag=Ply.Ope.StartUsingWeapon] run function mhdp_items:weapons/lance/type_tec/6_guard/change_to_counter
    # スニーク：ガードに移行
        execute if entity @s[tag=Wpn.Lc.Tec.Guard.Just,tag=Ply.Ope.StartSneak] run function mhdp_items:weapons/lance/type_tec/6_guard/change_to_guard
    # ステップ
        execute if entity @s[tag=Wpn.Lc.Tec.Guard.Just,tag=Ply.Ope.Buffering.Jump] run function mhdp_items:weapons/lance/type_tec/10_step/start

# 終了
    execute if score @s Wpn.GeneralTimer matches 20.. run function mhdp_items:weapons/lance/type_tec/6_guard/end_just
