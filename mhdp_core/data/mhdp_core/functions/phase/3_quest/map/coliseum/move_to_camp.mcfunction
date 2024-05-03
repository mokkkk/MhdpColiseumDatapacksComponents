#> mhdp_core:phase/3_quest/map/coliseum/move_to_camp
#
# クエスト中のtick処理 大闘技場 ベースキャンプへの移動
#
# @within function mhdp_core:phase/3_quest/tp/1_colliseum

# 移動
    tp @s 221 66 141

# 状態の更新
    tag @s remove Ply.State.MnsTarget
    tag @s remove Ply.State.EnableDamage
