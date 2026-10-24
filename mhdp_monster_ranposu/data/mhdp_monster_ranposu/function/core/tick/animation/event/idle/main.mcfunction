#> mhdp_monster_ranposu:core/tick/animation/event/idle/main
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s animated_java_ranposu.ranposu.idle.frame matches 59 run function mhdp_monster_ranposu:core/tick/animation/event/idle/end
