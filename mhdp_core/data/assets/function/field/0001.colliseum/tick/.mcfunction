#> assets:field/0001.colliseum/tick/
#
# フィールドtick処理

# ベースキャンプ→戦闘フィールドへの移動
    execute positioned 191 66 145 as @a[distance=..2.5] run function assets:field/0001.colliseum/tick/move_to_battlefield

# ベースキャンプでの回復
    execute positioned 237 66 136 run effect give @a[distance=..8] instant_health 1 0 true
