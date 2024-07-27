#> mhdp_monsters:core/util/damage/set_pos_to_shadow
# 
# 汎用処理 自身の影の位置に移動し、モデル表示位置と実際の位置を合わせる
#
# @within function mhdp_monsters:/**

# Uid取得
    execute store result storage mhdp_core:temp Temp.MonsterUid int 1 run scoreboard players get @s Mns.Uid

# prefix取得
    function mhdp_monsters:core/switch/macro/m.get_prefix with storage mhdp_core:temp Temp

# 影の位置を参照して移動する
    function mhdp_monsters:core/util/damage/macro/m.set_pos_to_shadow with storage mhdp_core:temp Temp

# 終了
    data remove storage mhdp_core:temp Temp
