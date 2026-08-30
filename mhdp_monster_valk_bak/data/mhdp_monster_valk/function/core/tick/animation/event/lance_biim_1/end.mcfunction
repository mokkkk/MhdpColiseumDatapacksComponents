#> mhdp_monster_valk:core/tick/animation/event/lance_biim_1/end
#
# アニメーションイベントハンドラ 龍閃
#
# @within function mhdp_monster_valk:core/tick/animation/event/lance_biim_1/main

# フェーズ2に移行
    function animated_java:valk_aj/animations/lance_biim_2/tween {duration:1, to_frame: 1}

# 終了
    scoreboard players reset #mhdp_temp_valk_flash_scale MhdpCore
