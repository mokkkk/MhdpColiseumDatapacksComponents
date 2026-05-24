#> mhdp_items:weapons/long_sword/util/avoid
#
# 武器のフレーム回避成功時処理
#
# @within function mhdp_items:core/switch/macro/m.avoid

# 見切り斬り成功判定
    execute if entity @s[tag=Wpn.Ls.Tec.Foresight] run function mhdp_items:weapons/long_sword/type_tec/9_foresight_slash/success
