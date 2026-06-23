#> assets:object/0015.nikuyaki/tick/
#
# オブジェクトのtick処理
#
# @within function mhdp_items:/**

# スコア増加
    scoreboard players add @s ObjectTick 1

# モデル処理
    execute on passengers run function assets:object/0015.nikuyaki/tick/on_model

# とりあえず仮で削除
    execute if score @s ObjectTick matches 300.. run function assets:object/0015.nikuyaki/tick/remove

# # カウンター低下
#     scoreboard players remove @s Mns.General.DummyCounter 1

# # カウンターがなくなったら削除
#     execute if score @s Mns.General.DummyCounter matches ..0 run function animated_java_nikuyaki:nikuyaki/remove/this
