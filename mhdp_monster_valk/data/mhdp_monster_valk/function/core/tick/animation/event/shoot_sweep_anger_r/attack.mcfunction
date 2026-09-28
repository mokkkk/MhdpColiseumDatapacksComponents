#> mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/attack
#
# アニメーションイベントハンドラ 薙ぎ払い・怒り時 (翼可動域の各点で判定・main から frame 範囲で実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/main

# 翼可動域の各点で判定
    function animated_java_valk:valk/at_locator {name:"pos_wing_r_1",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/hit"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_r_2",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/hit"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_r_3",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/hit"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_r_4",command:"function mhdp_monster_valk:core/tick/animation/event/shoot_sweep_anger_r/hit"}
