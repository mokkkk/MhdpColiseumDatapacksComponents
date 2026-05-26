#> api:bounding/cylinder.m
#
# 当たり判定計算ライブラリ呼び出し 円柱範囲
#
# @input arg Selector 計算対象とするセレクター
# @input arg Tag 対象に付与するタグ
# @input arg Radius 半径
# @input arg Height 高さ。想定の半分を指定すること

# 計算
    $data modify storage km_bounding: arguments.cylinder set value {selector:"$(Selector)",radius:$(Radius),y_plus:$(Height),y_minus:$(Height)}
    function km_bounding:cylinder/
    $tag @e[tag=bounding_cylinder] add $(Tag)
    tag @e[tag=bounding_cylinder] remove bounding_cylinder
