#> mhdp_items:sp_items/wirebug/using/start_move
#
# 翔蟲の使用中処理
#
# @within function mhdp_items:sp_items/wirebug/tick

# 移動先保持用のmarker召喚
    summon marker ~ ~ ~ {Tags:["Mk.Sp.Wirebug.Rotation","Mk.Start"]}

# データ設定
    execute at @s as @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Start,sort=nearest,limit=1] run tp @s ~ ~ ~ ~ ~
    scoreboard players operation @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Start,sort=nearest,limit=1] Ply.Uid = @s Ply.Uid

# 終了
    tag @e[type=marker,tag=Mk.Sp.Wirebug.Rotation,tag=Mk.Start,sort=nearest,limit=1] remove Mk.Start
