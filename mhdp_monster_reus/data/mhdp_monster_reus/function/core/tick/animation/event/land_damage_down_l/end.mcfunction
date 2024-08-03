#> mhdp_monster_reus:core/tick/animation/event/land_damage_down_l/end
#
# アニメーションイベントハンドラ ダウン開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/land_damage_down_l/main

# ダウンに移行
    function animated_java:reus_aj/animations/land_down_l/tween {duration:1, to_frame: 1}
