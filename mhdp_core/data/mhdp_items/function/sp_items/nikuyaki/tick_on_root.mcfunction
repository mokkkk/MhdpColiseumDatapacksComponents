#> mhdp_items:sp_items/nikuyaki/tick_on_root
#
# 肉焼きセットのメイン処理
#
# @within function mhdp_items:sp_items/tick

# # カウンター低下
#     scoreboard players remove @s Mns.General.DummyCounter 1

# # カウンターがなくなったら削除
#     execute if score @s Mns.General.DummyCounter matches ..0 run function animated_java:nikuyaki/remove/this
