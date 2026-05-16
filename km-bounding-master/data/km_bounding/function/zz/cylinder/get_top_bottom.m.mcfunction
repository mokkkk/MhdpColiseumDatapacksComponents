#> km_bounding:zz/cylinder/get_top_bottom.m
#
# @within function km_bounding:cylinder/
# ディメンションを跨ぐ可能性があるため角度保持用マーカを使わない

# 天面高さ
    $tp @s ~ ~$(y_plus) ~
    data modify storage km_bounding: cylinder.macro.y_top set from entity @s Pos[1]

# 底面高さ
    $tp @s ~ ~-$(y_minus) ~
    data modify storage km_bounding: cylinder.macro.y_bottom set from entity @s Pos[1]

# マーカ削除
    kill @s
