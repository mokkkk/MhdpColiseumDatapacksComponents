#> mhdp_items:weapons/short_sword/util/guard
#
# 武器のガード成功時処理
#
# @within function mhdp_items:core/switch/macro/m.guard

# 斬れ味消費なし

# 天の型時、ジャストガード判定
    execute if entity @s[tag=Ply.Weapon.Type.Tech,tag=Wpn.Ss.Tec.Guard] if score @s Wpn.GeneralTimer matches ..4 run function mhdp_items:weapons/short_sword/type_tec/24_guard/just_guard
    execute if entity @s[tag=Ply.Weapon.Type.Tech,tag=Wpn.Ss.Tec.GuardSlash] if score @s Wpn.GeneralTimer matches ..4 run function mhdp_items:weapons/short_sword/type_tec/24_guard/just_guard
