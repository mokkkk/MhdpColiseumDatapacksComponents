#> mhdp_items:sp_items/wirebug/using/move
#
# 翔蟲の使用中処理
#
# @within function mhdp_items:sp_items/wirebug/tick

# 移動
    tp @s @s
    scoreboard players set $strength delta.api.launch 14000
    execute rotated as @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Sp.Wirebug.Rotation.Target] run function delta:api/launch_looking

# 空中フラグ有効
    tag @s add Ply.Ope.IsAir

# 一時的に無重力化
    attribute @s gravity modifier add mhdp_core:sp_items_gravity -0.08 add_value

# 終了
    kill @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Sp.Wirebug.Rotation.Target]
