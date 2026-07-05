#> mhdp_monster_dino:core/tick/animation/event/roundforce/attack_tail_start
#
# アニメーションイベントハンドラ 尻尾攻撃・側面
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 攻撃実行
    function animated_java_dino:dino/at_locator {name:"pos_tail_1",command:"execute rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/roundforce/attack_tail"} 
    function animated_java_dino:dino/at_locator {name:"pos_tail_2",command:"execute rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/roundforce/attack_tail"} 
    function animated_java_dino:dino/at_locator {name:"pos_tail_3",command:"execute rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/roundforce/attack_tail"} 
    function animated_java_dino:dino/at_locator {name:"pos_tail_4",command:"execute rotated ~ 0 run function mhdp_monster_dino:core/tick/animation/event/roundforce/attack_tail"} 
