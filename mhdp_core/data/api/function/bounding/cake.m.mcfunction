#> api:bounding/cake.m
#
# 当たり判定計算ライブラリ呼び出し 扇範囲
#
# @input arg Selector 計算対象とするセレクター
# @input arg Tag 対象に付与するタグ
# @input arg Radius 半径
# @input arg Height 高さ。想定の半分を指定すること
# @input arg Angle 扇の角度。想定の半分を指定すること

# 計算
    $data modify storage km_bounding: arguments.cake set value {selector:"$(Selector)",radius:$(Radius),y_plus:$(Height),y_minus:$(Height),angle_plus:$(Angle),angle_minus:$(Angle)}
    function km_bounding:cake/
    $tag @e[tag=bounding_cake] add $(Tag)
    tag @e[tag=bounding_cake] remove bounding_cake
