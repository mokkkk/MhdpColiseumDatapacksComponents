#> mhdp_items:sp_items/tick
#
# 特殊装具のメイン処理
#
# @within function mhdp_items:player/tick

# 使用検知
    execute if entity @s[tag=Ply.Ope.StartUsingCoas,tag=!Ply.Weapon.Deactivated] run function mhdp_items:core/switch/item/use

# メイン処理
    # 翔蟲
        execute if entity @s[tag=Itm.Sp.Wirebug] run function mhdp_items:sp_items/wirebug/tick
