#> mhdp_monster_valk:core/tick/animation/event/idle_relax/end
#
# アニメーションイベントハンドラ 待機 (未発見時)
#
# @within function mhdp_monster_valk:core/tick/animation/event/idle_relax/main

# 一定確率で遷移
    execute if predicate {"condition":"minecraft:random_chance","chance":0.6} run function mhdp_monster_valk:core/tick/animation/change/main
