#> mhdp_items:weapons/bow/shot/apply_bottle_effect
#
# 矢の処理
#
# @within function mhdp_items:/**

# タグ付与
    execute if score @s Wpn.Bw.Bottle.Type matches 0 run tag @e[type=item_display,tag=Other.Shot,tag=Wpn.Bw.Shot.Normal,tag=Start] add Wpn.Bw.Shot.Bottle.Strong

# 終了
    scoreboard players remove @s Wpn.Bw.Bottle.Count 1
