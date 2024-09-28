#> mhdp_core:other_entity/shot/tick
#
# 毎tick実行される処理 shot処理
#
# @within function minecraft:tick

# 弓
    # 通常矢
        execute if entity @s[tag=Wpn.Bw.Shot.Normal] run function mhdp_items:weapons/bow/shot/normal/tick
