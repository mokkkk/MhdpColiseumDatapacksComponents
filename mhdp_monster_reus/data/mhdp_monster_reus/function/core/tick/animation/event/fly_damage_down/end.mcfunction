#> mhdp_monster_reus:core/tick/animation/event/fly_damage_down/end
#
# アニメーションイベントハンドラ 飛行中ダウン
#
# @within function mhdp_monster_reus:core/tick/animation/event/fly_damage_down/main

# ダウンに移行
    function animated_java:reus_aj/animations/land_down_r/tween {duration:1, to_frame: 1}
