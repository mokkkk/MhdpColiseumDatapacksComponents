#> mhdp_core:other_entity/shot/tick
#
# 毎tick実行される処理 shot処理
# TODO: ここの処理は全部消してObjectに移行する
#
# @within function minecraft:tick

# 肉焼きセット
    execute if entity @s[tag=Itm.Root.Nikuyaki] run function mhdp_items:sp_items/nikuyaki/tick_on_root

# 行方不明対策
    execute unless loaded ^ ^ ^2 run kill @s
