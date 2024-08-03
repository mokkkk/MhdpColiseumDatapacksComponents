#> mhdp_monster_reus:core/tick/animation/event/fly_damage_down/end
#
# アニメーションイベントハンドラ 飛行中ダウン
#
# @within function mhdp_monster_reus:core/tick/animation/event/fly_damage_down/main

# 麻痺の場合、飛行中麻痺に移行
    execute if entity @s[tag=Mns.State.IsParalysis] run return run function animated_java:reus_aj/animations/fly_state_paralysis/tween {duration:1, to_frame: 1}

# ダウンに移行
    function animated_java:reus_aj/animations/land_down_r/tween {duration:1, to_frame: 1}
