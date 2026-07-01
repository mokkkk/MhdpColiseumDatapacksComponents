#> mhdp_monster_dino:core/tick/animation/event/tail_side_r/attack_tail_start
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 攻撃実行
    function animated_java_dino:dino/at_locator {name:"pos_tail_1",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/attack_tail"} 
    function animated_java_dino:dino/at_locator {name:"pos_tail_2",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/attack_tail"} 
    function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/attack_tail"} 
    function animated_java_dino:dino/at_locator {name:"pos_tail_4",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/attack_tail"} 

# 演出
    execute if score @s aj.tail_side_r.frame matches 37..39 run function animated_java_dino:dino/at_locator {name:"pos_tail_1",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/particle_tail"}
    execute if score @s aj.tail_side_r.frame matches 37..39 run function animated_java_dino:dino/at_locator {name:"pos_tail_2",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/particle_tail"}
    execute if score @s aj.tail_side_r.frame matches 37..39 run function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/particle_tail"}
    execute if score @s aj.tail_side_r.frame matches 37..39 run function animated_java_dino:dino/at_locator {name:"pos_tail_4",command:"execute rotated as @s rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/tail_side_r/particle_tail"}