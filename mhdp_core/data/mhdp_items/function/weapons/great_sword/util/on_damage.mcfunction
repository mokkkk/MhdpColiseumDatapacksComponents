#> mhdp_items:weapons/great_sword/util/on_damage
#
# 武器の被ダメージ時処理
#
# @within function mhdp_items:core/switch/macro/m.on_damage

# # 反撃斬り上げ
#     execute if entity @s[tag=Wpn.Gs.Tec.Upper] run function mhdp_items:weapons/great_sword/type_tec/14_upper_slash/counter
