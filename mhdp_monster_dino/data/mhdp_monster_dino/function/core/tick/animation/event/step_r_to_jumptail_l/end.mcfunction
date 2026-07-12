#> mhdp_monster_dino:core/tick/animation/event/step_r_to_jumptail_l/end
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_dino:core/tick/animation/event/step_r_to_jumptail_l/main

# 尻尾たたきつけに移行
    function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    function animated_java_dino:dino/animations/jump_tail_l/tween {duration:1, to_frame: 10}
