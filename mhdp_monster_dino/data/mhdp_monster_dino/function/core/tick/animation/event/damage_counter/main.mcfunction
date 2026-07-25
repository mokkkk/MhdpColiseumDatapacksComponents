#> mhdp_monster_dino:core/tick/animation/event/damage_counter/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.damage_counter.frame matches 59 run function mhdp_monster_dino:core/tick/animation/event/damage_counter/end
