#> mhdp_core:other_entity/shot/tick
#
# 毎tick実行される処理 shot処理
#
# @within function minecraft:tick

# 弓
    # 通常矢
        execute if entity @s[tag=Wpn.Bw.Shot.Normal] run function mhdp_items:weapons/bow/shot/normal/tick
    # 竜の一矢
        execute if entity @s[tag=Wpn.Bw.Shot.Pierce] run function mhdp_items:weapons/bow/shot/pierce/tick
    # 竜の千々矢
        execute if entity @s[tag=Wpn.Bw.Shot.Shower] run function mhdp_items:weapons/bow/shot/shower/tick
    # 導ノ矢
        execute if entity @s[tag=Wpn.Bw.Shot.Horming] run function mhdp_items:weapons/bow/shot/horming/tick

# 行方不明対策
    execute unless loaded ^ ^ ^2 run kill @s
