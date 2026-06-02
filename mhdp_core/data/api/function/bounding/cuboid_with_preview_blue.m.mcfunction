#> api:bounding/cuboid_with_preview.m
#
# 当たり判定計算ライブラリ呼び出し 直方体範囲
# item_displayによるプレビューを表示する
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

# デバッグ有効ではない場合、プレビューは表示しない
    execute unless data storage mhdp_core:game_data {ShowDebugMessage:true} run return 0

# プレビュー表示
    $data modify storage api: Arg.Override.X set value $(X)
    $data modify storage api: Arg.Override.Y set value $(Y)
    $data modify storage api: Arg.Override.Z set value $(Z)
    data modify storage api: Arg.Override.Color set value "blue"
    function api:object/summon.m {ObjectId:14}
