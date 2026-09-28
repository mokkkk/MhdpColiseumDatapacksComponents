#> mhdp_monster_valk:core/tick/effect_anger
#
# tick処理 怒り中演出
#
# @within function mhdp_monster_valk:core/tick/main

# 頭
    function animated_java_valk:valk/at_locator {name:"pos_head",command:"function mhdp_monster_valk:core/tick/effect_anger_head"}
# 翼
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_0",command:"function mhdp_monster_valk:core/tick/effect_anger_wing"}
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_1",command:"function mhdp_monster_valk:core/tick/effect_anger_wing"}
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_r_2",command:"function mhdp_monster_valk:core/tick/effect_anger_wing"}
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_0",command:"function mhdp_monster_valk:core/tick/effect_anger_wing"}
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_1",command:"function mhdp_monster_valk:core/tick/effect_anger_wing"}
    function animated_java_valk:valk/at_locator {name:"pos_muzzle_l_2",command:"function mhdp_monster_valk:core/tick/effect_anger_wing"}
