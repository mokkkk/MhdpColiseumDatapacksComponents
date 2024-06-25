#> mhdp_monsters:core/switch/tick
# 
# 分岐処理 モンスターtick処理
#
# @within function mhdp_monsters:/**

# Uid取得
    execute store result storage mhdp_core:temp Temp.MonsterUid int 1 run scoreboard players get @s Mns.Uid

# 分岐処理
    function mhdp_monsters:core/switch/macro/m.get_prefix with storage mhdp_core:temp Temp
    function mhdp_monsters:core/switch/macro/m.tick with storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Temp
    data remove storage mhdp_core:temp Arg
