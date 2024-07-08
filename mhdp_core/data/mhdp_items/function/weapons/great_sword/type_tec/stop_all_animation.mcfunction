#> mhdp_items:weapons/great_sword/type_tec/stop_all_animation
#
# 大剣のメイン処理 天の型 アニメーション停止
#
# @within function mhdp_items:weapons/great_sword/main


# タグ消去
    # tag @s remove Wpn.Gs.Tec.Charge
    # tag @s remove Wpn.Gs.Tec.ChargeSlash
    # tag @s remove Wpn.Gs.Tec.Guard
    # tag @s remove Wpn.Gs.Tec.Tackle
    # tag @s remove Wpn.Gs.Tec.HuntingEdge
    # tag @s remove Wpn.Gs.Tec.Charge.Edge
    # tag @s remove Wpn.Gs.Tec.ChargeSlash.Edge

function mhdp_items:weapons/great_sword/util/stop_all_animations