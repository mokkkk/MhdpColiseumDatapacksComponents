#> mhdp_monster_ranposu:core/tick/animation/event/damage_counter_start/end
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 怯み終了に移行
    function animated_java:ranposu_aj/animations/damage_counter/tween {duration:1, to_frame: 1}
