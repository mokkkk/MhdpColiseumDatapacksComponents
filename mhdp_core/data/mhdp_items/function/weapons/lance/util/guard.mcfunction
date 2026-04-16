#> mhdp_items:weapons/lance/util/guard
#
# 武器のガード成功時処理
#
# @within function mhdp_items:core/switch/macro/m.guard

# 斬れ味消費なし

# ジャストガード判定
    execute if entity @s[tag=Ply.Weapon.Type.Tech,tag=Wpn.Lc.Tec.Guard] if score @s Wpn.GeneralTimer matches ..4 run function mhdp_items:weapons/lance/type_tec/6_guard/just_guard

# ガードダッシュ
    execute if entity @s[tag=Ply.Weapon.Type.Tech,tag=Wpn.Lc.Tec.GuardDash] run function mhdp_items:weapons/lance/type_tec/7_guard_dash/guard

# 溜めカウンター
    execute if entity @s[tag=Ply.Weapon.Type.Tech,tag=Wpn.Lc.Tec.ChargeCounter] run function mhdp_items:weapons/lance/type_tec/11_charge_counter/guard

# カウンター突き・ジャスト判定
    execute if entity @s[tag=Ply.Weapon.Type.Tech,tag=Wpn.Lc.Tec.CounterSpear] if score @s Wpn.GeneralTimer matches ..4 run function mhdp_items:weapons/lance/type_tec/12_counter_spear/guard
