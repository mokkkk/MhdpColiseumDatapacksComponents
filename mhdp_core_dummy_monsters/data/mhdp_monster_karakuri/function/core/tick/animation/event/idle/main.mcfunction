#> mhdp_monster_karakuri:core/tick/animation/event/idle/main
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_karakuri:core/tick/animation/event/tick

# 接地

# 終了
    execute if score @s aj.idle.frame matches 57 run function mhdp_monster_karakuri:core/tick/animation/event/idle/end
