#> mhdp_monster_dino:core/tick/animation/event/idle/end
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_dino:core/tick/animation/event/idle/main

# 一定確率で遷移
    execute if predicate {"condition":"minecraft:random_chance","chance":0.4} run function mhdp_monster_dino:core/tick/animation/change/main
