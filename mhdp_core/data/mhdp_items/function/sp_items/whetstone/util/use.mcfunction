#> mhdp_items:sp_items/whetstone/util/use
#
# 砥石使用開始処理
#
# @within function mhdp_items:core/switch/macro/m.drawing

# 使用中の場合、中断
    execute if entity @s[tag=Itm.Sp.Whetstone.Using] run return 0

# 遠距離武器の場合、中断
    execute if entity @s[tag=Ply.Weapon.Equip.Bow] run return 0

# 使用開始
    scoreboard players set @s Itm.Whetstone.GeneralTimer 0
    tag @s add Itm.Sp.Whetstone.Using
