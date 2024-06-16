#> mhdp_monsters:core/switch/show_bossbar
# 
# 分岐処理 ボスバー表示処理
#
# @within function mhdp_core:phase/3_quest/map/**

# Uid取得
    execute store result storage mhdp_core:temp Temp.MonsterUid int 1 run scoreboard players get @s Mns.Uid

# 分岐処理
    function mhdp_monsters:core/switch/macro/m.get_prefix with storage mhdp_core:temp Temp
    function mhdp_monsters:core/switch/macro/m.show_bossbar with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
