#> assets:object/0015.nikuyaki/tick/remove
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# モデルを消去
    execute on passengers if entity @s[type=item_display] run function animated_java_nikuyaki:nikuyaki/remove/this

# 自身を消去
    kill @s
