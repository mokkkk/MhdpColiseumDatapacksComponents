#> km_bounding:cake/
#
# 扇形柱（切り出したケーキのような形）の範囲にいるエンティティにタグを付与する
#
# @input args
#   position: 実行位置
#       基準点（扇型の中心）
#   rotation: 実行向き
#       基準向き（横向きのみ反映）
#   storage km_bounding: arguments.cake.selector: string
#       判定対象とするエンティティのセレクタ
#   storage km_bounding: arguments.cake.radius: double
#       扇型柱の半径
#   storage km_bounding: arguments.cake.y_plus: double
#       基準点から扇型柱の天面までの距離
#   storage km_bounding: arguments.cake.y_minus: double
#       基準点から扇型柱の底面までの距離
#   storage km_bounding: arguments.cake.angle_plus: double
#       基準向きからプラス方向の扇型の角度
#   storage km_bounding: arguments.cake.angle_minus: double
#       基準向きからマイナス方向の扇型の角度
#
# @output tag bounding_cake
#
# @api
#
#> return
# @api
    #declare tag bounding_cake

# 引数チェック
    execute unless data storage km_bounding: arguments.cake.selector run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cake/","color":"gold"},{"text":"のselector引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cake.radius run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cake/","color":"gold"},{"text":"のradius引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cake.y_plus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cake/","color":"gold"},{"text":"のy_plus引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cake.y_minus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cake/","color":"gold"},{"text":"のy_minus引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cake.angle_plus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cake/","color":"gold"},{"text":"のangle_plus引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cake.angle_minus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cake/","color":"gold"},{"text":"のangle_minus引数が不足しています。","color":"white"}]

# パラメータをコピー
    data modify storage km_bounding: cake.macro set from storage km_bounding: arguments.cake

# 数値計算
    execute summon marker run function km_bounding:zz/cake/calc.m with storage km_bounding: cake.macro

# マクロで判定
    function km_bounding:zz/cake/cylinder.m with storage km_bounding: cake.macro

# ストレージリセット
    data modify storage km_bounding: arguments.cake set value {selector:"@e",radius:0.0,y_plus:0.0,y_minus:0.0,angle_plus:0.0,angle_minus:0.0}
    data remove storage km_bounding: cake