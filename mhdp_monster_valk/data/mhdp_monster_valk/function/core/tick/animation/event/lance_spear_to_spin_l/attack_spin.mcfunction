#> mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/attack_spin
#
# アニメーションイベントハンドラ 翼槍回転斬り (左翼爪・回転斬り)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/main

# 攻撃実行 (翼爪の可動域に沿って複数点判定)
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_1",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/hit_spin"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_2",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/hit_spin"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_3",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/hit_spin"}
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_4",command:"function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/hit_spin"}
