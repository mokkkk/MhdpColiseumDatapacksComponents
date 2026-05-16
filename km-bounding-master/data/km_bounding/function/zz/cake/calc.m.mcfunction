#> km_bounding:zz/cake/calc.m
#
# @within function km_bounding:cake/

# 角度を足す
    $execute rotated $(angle_plus) 0 run rotate @s ~$(angle_minus) 0

# 180°以上か以下か判定
    execute if entity @s[y_rotation=..180] run data modify storage km_bounding: cake.macro.function set value "less"
    execute unless entity @s[y_rotation=..180] run data modify storage km_bounding: cake.macro.function set value "more"

# 天面高さ取得
    $tp @s ~ ~$(y_plus) ~
    data modify storage km_bounding: cake.macro.y_top set from entity @s Pos[1]

# 底面高さ取得
    $tp @s ~ ~-$(y_minus) ~
    data modify storage km_bounding: cake.macro.y_bottom set from entity @s Pos[1]

# マーカ削除
    kill @s
