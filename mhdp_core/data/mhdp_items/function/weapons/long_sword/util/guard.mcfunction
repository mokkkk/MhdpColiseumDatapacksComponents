#> mhdp_items:weapons/long_sword/util/guard
#
# 武器のガード成功時処理
#
# @within function mhdp_items:core/switch/macro/m.guard

# 斬れ味消費なし

# 天の型
    # 鏡花の構え
        execute if entity @s[tag=Ply.Weapon.Type.Tech,tag=Wpn.Ls.Tec.Juncture] run return run function mhdp_items:weapons/long_sword/type_tec/27_critical_juncture/guard
