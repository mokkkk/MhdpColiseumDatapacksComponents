#> mhdp_monster_valk:core/tick/animation/event/lance_damage_counter/main
#
# アニメーションイベントハンドラ 怯み・反撃硬直
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_damage_counter.frame matches 59 run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter/end
