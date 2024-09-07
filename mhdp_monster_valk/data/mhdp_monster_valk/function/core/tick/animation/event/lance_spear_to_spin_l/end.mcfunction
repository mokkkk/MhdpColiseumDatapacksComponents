#> mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/end
#
# アニメーションイベントハンドラ 翼槍回転斬り
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_spear_to_spin_l/main

# 確定で威嚇
    function animated_java:valk_aj/animations/lance_idle/tween {duration:1, to_frame: 0}
