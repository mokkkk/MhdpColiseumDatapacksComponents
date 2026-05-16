#> km_bounding:cuboid/
#
# 直方体範囲内の検索対象にタグを付与する
# ざっくりいうと回転可能なdx,dy,dz判定ですが、下記の違いがあるため注意
#   -実行向きのローカル座標軸に沿って直方体が広がる
#   -基準点からプラス・マイナス両方向に広がる
#   -大きさが+1されない
#   -ヒットボックスの大きさを考慮せず、位置のみで判定する
#
# @input args
#   position: 実行位置
#       基準点
#   rotation: 実行向き
#       直方体の向き
#   storage km_bounding: arguments.cuboid.selector: string
#       判定対象とするエンティティのセレクタ
#   storage km_bounding: arguments.cuboid.x_plus: double
#       基準点からX+方向への大きさ
#   storage km_bounding: arguments.cuboid.y_plus: double
#       基準点からY+方向への大きさ
#   storage km_bounding: arguments.cuboid.z_plus: double
#       基準点からZ+方向への大きさ
#   storage km_bounding: arguments.cuboid.x_minus: double
#       基準点からX-方向への大きさ
#   storage km_bounding: arguments.cuboid.y_minus: double
#       基準点からY-方向への大きさ
#   storage km_bounding: arguments.cuboid.z_minus: double
#       基準点からZ-方向への大きさ
#
# @output tag bounding_cuboid
#
# @api
#
#> return
# @api
    #declare tag bounding_cuboid

# 引数チェック
    execute unless data storage km_bounding: arguments.cuboid.selector run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cuboid/","color":"gold"},{"text":"のselector引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cuboid.x_plus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cuboid/","color":"gold"},{"text":"のx_plus引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cuboid.y_plus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cuboid/","color":"gold"},{"text":"のy_plus引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cuboid.z_plus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cuboid/","color":"gold"},{"text":"のz_plus引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cuboid.x_minus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cuboid/","color":"gold"},{"text":"のx_minus引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cuboid.y_minus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cuboid/","color":"gold"},{"text":"のy_minus引数が不足しています。","color":"white"}]
    execute unless data storage km_bounding: arguments.cuboid.z_minus run return run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cuboid/","color":"gold"},{"text":"のz_minus引数が不足しています。","color":"white"}]

# 角度保持用マーカを実行向きに
    rotate 314-0-3bd-0-161 ~ ~

# 各エンティティにファンクション実行
    execute store success storage km_bounding: cuboid.success_flag byte 1 run function km_bounding:zz/cuboid/geometry.m with storage km_bounding: arguments.cuboid

# 引数エラーメッセージ
    execute unless data storage km_bounding: {cuboid:{success_flag:1b}} run tellraw @a [{"text":"ERROR >> ","color":"red"},{"text":"km_bounding:cuboid/","color":"gold"},{"text":"の引数が不足しています。","color":"white"}]

# ストレージをリセット
    data modify storage km_bounding: arguments.cuboid set value {selector:"@e",x_plus:0.0,y_plus:0.0,z_plus:0.0,x_minus:0.0,y_minus:0.0,z_minus:0.0}
    data remove storage km_bounding: cuboid