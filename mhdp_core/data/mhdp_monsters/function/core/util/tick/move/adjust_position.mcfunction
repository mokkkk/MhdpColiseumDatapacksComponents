#> mhdp_monsters:core/util/tick/move/adjust_position
# 
# 汎用処理 位置調整
#
# @within function mhdp_monsters:core/util/tick/tick

# 現在位置を保持
    data modify storage mhdp_core:temp MonsterTemp.CurrentPos.Height set from entity @s Pos[1]

# Y座標確認
    function mhdp_monsters:core/util/tick/move/check_height.m with storage mhdp_core:temp MonsterTemp.CurrentPos

# 前の位置に戻る
    function mhdp_monsters:core/util/tick/move/back_to_preposition

# # PrePos更新
#     function mhdp_monsters:core/util/tick/move/save_position
