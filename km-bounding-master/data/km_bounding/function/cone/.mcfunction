#> km_bounding:cone/
#
# 円錐型の範囲にいるエンティティにタグを付与する
# （底面はないのでセレクタで最大距離を設定するなどしてください）
#
# @input args
#   position: 実行位置
#       円錐の頂点
#   rotation: 実行向き
#       円錐の軸
#   storage km_bounding: arguments.cone.selector: string
#       判定対象とするエンティティのセレクタ(distanceの最大距離を設定することを推奨)
#   storage km_bounding: arguments.cone.angle: float
#       円錐の半頂角(0°~180°)
#
# @output tag bounding_cone
#
# @api
#
#> return
# @api
    #declare tag bounding_cone

# 引数チェック
    execute unless data storage km_bounding: arguments.cone.angle run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cone/","color":"gold"},{"text":"のangle引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cone.selector run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cone/","color":"gold"},{"text":"のselector引数が不足しています。","color":"white"}]

# 引数をマクロ用ストレージにコピー
    data modify storage km_bounding: cone.macro.selector set from storage km_bounding: arguments.cone.selector

# 一時マーカを実行者にして計算
    execute summon marker run function km_bounding:zz/cone/calc

# 角度保持用マーカの向きを実行向きに合わせる
    rotate 314-0-3bd-0-161 ~ ~

# マクロと幾何学で判定
    function km_bounding:zz/cone/detect.m with storage km_bounding: cone.macro

# ストレージリセット
    data modify storage km_bounding: arguments.cone set value {selector:"@e",angle:0}
    data remove storage km_bounding: cone