#> mhdp_items:sp_items/nikuyaki/tick
#
# 肉焼きセットのメイン処理
#
# @within function mhdp_items:sp_items/tick

# 使用中処理
    execute if entity @s[tag=Itm.Sp.Nikuyaki.Using] run function mhdp_items:sp_items/nikuyaki/using/tick
