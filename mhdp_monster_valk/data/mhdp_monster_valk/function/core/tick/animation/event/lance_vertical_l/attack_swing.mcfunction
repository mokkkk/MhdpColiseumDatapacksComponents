#> mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/attack_swing
#
# アニメーションイベントハンドラ 翼槍叩きつけ 振り下ろし中の当たり判定 (main から frame 範囲で実行)
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/main

# 翼爪先端 (pos_wing_l_3) 基準で判定
    function animated_java_valk:valk/at_locator {name:"pos_wing_l_3",command:"function mhdp_monster_valk:core/tick/animation/event/lance_vertical_l/hit_swing"}
