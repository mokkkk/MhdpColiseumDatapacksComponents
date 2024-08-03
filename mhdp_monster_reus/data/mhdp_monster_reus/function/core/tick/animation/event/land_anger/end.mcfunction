#> mhdp_monster_reus:core/tick/animation/event/land_voice/end
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_voice/main

# バックジャンプブレスに移行
    function animated_java:reus_aj/animations/land_bjb/tween {duration:1, to_frame: 1}
