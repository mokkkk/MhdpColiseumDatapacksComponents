#> mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/thunder_start
#
# アニメーションイベントハンドラ 前方爆発 雷エフェクト召喚
#
# @within function mhdp_monster_valk:core/tick/animation/event/shoot_bomb_forward/main

# Object: Thunder (10048)
    # 召喚
        data modify storage api: Arg.Override set value {Tag:"WingR0",Scale:3}
        function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_0",command:"function api:object/summon.m {ObjectId:10048}"}
        data modify storage api: Arg.Override set value {Tag:"WingR1",Scale:3}
        function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_1",command:"function api:object/summon.m {ObjectId:10048}"}
        data modify storage api: Arg.Override set value {Tag:"WingR2",Scale:3}
        function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_2",command:"function api:object/summon.m {ObjectId:10048}"}
        data modify storage api: Arg.Override set value {Tag:"WingL0",Scale:3}
        function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_0",command:"function api:object/summon.m {ObjectId:10048}"}
        data modify storage api: Arg.Override set value {Tag:"WingL1",Scale:3}
        function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_1",command:"function api:object/summon.m {ObjectId:10048}"}
        data modify storage api: Arg.Override set value {Tag:"WingL2",Scale:3}
        function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_2",command:"function api:object/summon.m {ObjectId:10048}"}
