#> km_bounding:cylinder/
#
# 円柱型の範囲にいるエンティティにタグを付与する
#
# @input args
#   position: 実行位置
#       基準点（円の中心）
#   storage km_bounding: arguments.cylinder.selector: string
#       判定対象とするエンティティのセレクタ
#   storage km_bounding: arguments.cylinder.radius: double
#       円柱の半径
#   storage km_bounding: arguments.cylinder.y_plus: double
#       基準点から円柱の天面までの距離
#   storage km_bounding: arguments.cylinder.y_minus: double
#       基準点から円柱の底面までの距離
#
# @output tag bounding_cylinder
#
# @api
#
#> return
# @api
    #declare tag bounding_cylinder

# 引数チェック
    execute unless data storage km_bounding: arguments.cylinder.selector run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:bounding_cylinder/","color":"gold"},{"text":"のselector引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cylinder.radius run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:bounding_cylinder/","color":"gold"},{"text":"のradius引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cylinder.y_plus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:bounding_cylinder/","color":"gold"},{"text":"のy_plus引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cylinder.y_minus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:bounding_cylinder/","color":"gold"},{"text":"のy_minus引数が不足しています。","color":"white"}]

# パラメータをコピー
    data modify storage km_bounding: cylinder.macro set from storage km_bounding: arguments.cylinder

# 天面＆底面高さ取得
    execute summon marker run function km_bounding:zz/cylinder/get_top_bottom.m with storage km_bounding: cylinder.macro

# マクロで判定
    function km_bounding:zz/cylinder/detect.m with storage km_bounding: cylinder.macro

# ストレージリセット
    data modify storage km_bounding: arguments.cylinder set value {selector:"@e",radius:0.0,y_plus:0.0,y_minus:0.0}
    data remove storage km_bounding: cylinder
