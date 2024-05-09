#> mhdp_core:phase/3_quest/map/coliseum/main
#
# クエスト中のtick処理 大闘技場
#
# @within function mhdp_core:phase/3_quest/tick

# ベースキャンプ→戦闘フィールドへの移動
    execute positioned 191 66 145 as @a[distance=..2.5] run function mhdp_core:phase/3_quest/map/coliseum/move_to_battlefield

# ベースキャンプでの回復
    execute positioned 237 66 136 run effect give @a[distance=..8] instant_health 1 0 true
