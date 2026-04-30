#> assets:field/0001.colliseum/tick/
#
# フィールドtick処理

# エリア移動
    # BC -> エリア1
        execute positioned 191 66 145 if entity @a[distance=..2.5] as @a[distance=..2.5] run function assets:core/field/area/move_area.m {From:0, To:1}

# ベースキャンプでの回復
    execute positioned 237 66 136 run effect give @a[distance=..8] instant_health 1 0 true
