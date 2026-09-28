#> mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/thunder_tick
#
# アニメーションイベントハンドラ 前方爆発 雷エフェクト追従
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/main

# 演出移動
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_0",command:"tp @e[type=text_display,tag=10048.WingR0] ^ ^-0.2 ^0.3"}
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_1",command:"tp @e[type=text_display,tag=10048.WingR1] ^ ^-0.2 ^0.3"}
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_2",command:"tp @e[type=text_display,tag=10048.WingR2] ^ ^-0.2 ^0.3"}
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_0",command:"tp @e[type=text_display,tag=10048.WingL0] ^ ^-0.2 ^0.3"}
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_1",command:"tp @e[type=text_display,tag=10048.WingL1] ^ ^-0.2 ^0.3"}
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_2",command:"tp @e[type=text_display,tag=10048.WingL2] ^ ^-0.2 ^0.3"}
