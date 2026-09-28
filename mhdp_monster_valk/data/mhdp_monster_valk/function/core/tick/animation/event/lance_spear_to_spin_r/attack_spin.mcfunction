#> mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/attack_spin
#
# アニメーションイベントハンドラ 翼槍回転斬り (右翼爪・回転斬り)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/main

# 攻撃実行 (翼爪の可動域に沿って複数点判定)
    function animated_java_valk:valk/at_locator {name:"pos_wing_r_1",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/hit_spin"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_r_2",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/hit_spin"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_r_3",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/hit_spin"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_r_4",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_r/hit_spin"}
