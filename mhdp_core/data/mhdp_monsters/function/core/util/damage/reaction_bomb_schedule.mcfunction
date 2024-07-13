#> mhdp_monsters:core/util/damage/reaction_bomb_schedule
# 
# 汎用処理 爆破効果発動
#
# @within function mhdp_monsters:/**

# 実行
    execute as @e[type=marker,tag=Temp.Bomb.Marker] run function mhdp_monsters:core/util/damage/reaction_bomb_schedule_marker
