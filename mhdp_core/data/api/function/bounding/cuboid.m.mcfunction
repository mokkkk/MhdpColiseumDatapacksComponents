#> api:bounding/cuboid.m
#
# 当たり判定計算ライブラリ呼び出し 直方体範囲
#
# @input arg Selector 計算対象とするセレクター
# @input arg Tag 対象に付与するタグ
# @input arg X 幅。半分を指定すること
# @input arg Y 高さ。半分を指定すること
# @input arg Z 奥行。半分を指定すること

# 計算
    $data modify storage km_bounding: arguments.cuboid set value {selector:"$(Selector)",x_plus:$(X),x_minus:$(X),y_plus:$(Y),y_minus:$(Y),z_plus:$(Z),z_minus:$(Z)}
    function km_bounding:cuboid/
    $tag @e[tag=bounding_cuboid] add $(Tag)
    tag @e[tag=bounding_cuboid] remove bounding_cuboid
