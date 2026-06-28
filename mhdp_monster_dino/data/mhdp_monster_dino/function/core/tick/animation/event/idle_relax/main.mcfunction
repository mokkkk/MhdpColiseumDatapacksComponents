#> mhdp_monster_dino:core/tick/animation/event/idle_relax/main
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.idle_relax.frame matches 74 run function mhdp_monster_dino:core/tick/animation/event/idle_relax/end
