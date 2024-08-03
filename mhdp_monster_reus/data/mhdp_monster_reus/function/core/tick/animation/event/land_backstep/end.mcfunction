#> mhdp_monster_reus:core/tick/animation/event/land_backstep/end
#
# アニメーションイベントハンドラ バックステップ
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_backstep/main

# ブレスに移行
    function animated_java:reus_aj/animations/land_breath/tween {duration:1, to_frame: 1}