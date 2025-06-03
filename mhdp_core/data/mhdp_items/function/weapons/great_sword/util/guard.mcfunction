#> mhdp_items:weapons/great_sword/util/guard
#
# 武器のガード成功時処理
#
# @within function mhdp_items:core/switch/macro/m.guard

# 天の型時、ジャストガード判定
    execute if entity @s[tag=Ply.Weapon.Type.Tech,tag=Wpn.Gs.Tec.Guard] if score @s Wpn.GeneralTimer matches ..4 run function mhdp_items:weapons/great_sword/type_tec/4_guard/just_guard

# 斬れ味消費
    execute unless entity @s[tag=Wpn.Gs.Tec.Guard.Just] run function api:weapon_operation/decrease_sharpness.m {Value:2}
