#> km_bounding:plane/.if
#
# 実行位置を通り、実行向きに直行する面より前に、実行者がいるか判定するif関数
#
# @api

# 角度保持用マーカを実行向きに
    rotate 314-0-3bd-0-161 ~ ~

# 幾何学で判定
    execute facing entity @s feet positioned as @s positioned ^ ^ ^3 rotated as 314-0-3bd-0-161 positioned ^ ^ ^4 if entity @s[distance=5..] run return 1

# 失敗時戻り値
    return fail