#> mhdp_items:weapons/great_sword/type_tec/14_upper_slash/counter
#
# 相殺斬り上げ カウンター成功
#
# @within function mhdp_items:weapons/great_sword/type_tec/1_charge/change_to_chargeattack

# 出始め以外は失敗
    execute if score @s Wpn.GeneralTimer matches 4.. run return 0

# ダメージを軽減
    scoreboard players set #mhdp_temp_damage_reduction MhdpCore 25

# カウンター成功タグ付与
    tag @s add Ply.Flag.Counter
