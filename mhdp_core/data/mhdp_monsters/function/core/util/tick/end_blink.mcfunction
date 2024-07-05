#> mhdp_monsters:core/util/tick/end_blink
# 
# 汎用処理 まばたき終了
#
# @within function mhdp_monsters:core/util/tick/tick

# 分岐処理
    function mhdp_monsters:core/switch/end_blink

# 状態更新
    tag @s remove Mns.State.IsBlink
