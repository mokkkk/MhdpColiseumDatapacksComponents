#> mhdp_monster_valk:core/tick/animation/event/shoot_sweep_l/attack
#
# アニメーションイベントハンドラ 薙ぎ払い (翼可動域の各点で判定・main から frame 範囲で実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_l/main

# 翼可動域の各点で判定
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_1",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_l/hit"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_2",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_l/hit"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_3",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_l/hit"}
