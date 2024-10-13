#> mhdp_items:sp_items/tick
#
# 特殊装具のメイン処理
#
# @within function mhdp_items:player/tick

# 使用検知
    execute if entity @s[tag=Ply.Ope.StartUsingCoas,tag=!Ply.Weapon.Deactivated] run function mhdp_items:core/switch/item/use

# メイン処理
    # 砥石
        function mhdp_items:sp_items/whetstone/tick
    # 翔蟲
        execute if entity @s[tag=Itm.Sp.Wirebug] run function mhdp_items:sp_items/wirebug/tick
    # 不動の装衣
        execute if entity @s[tag=Itm.Sp.ImmovableCloth] run function mhdp_items:sp_items/immovable_cloth/tick
