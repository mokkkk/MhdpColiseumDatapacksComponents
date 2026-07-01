#> mhdp_monster_dino:core/tick/animation/event/tail_side_l/particle_tail_start
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 演出
    function animated_java_dino:dino/at_locator {name:"pos_tail_1",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/particle_tail"}
    function animated_java_dino:dino/at_locator {name:"pos_tail_2",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/particle_tail"}
    function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/particle_tail"}
    function animated_java_dino:dino/at_locator {name:"pos_tail_4",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_l/particle_tail"}
