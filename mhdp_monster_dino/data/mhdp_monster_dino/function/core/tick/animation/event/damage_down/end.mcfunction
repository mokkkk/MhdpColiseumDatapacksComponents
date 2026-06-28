#> mhdp_monster_ranposu:core/tick/animation/event/damage_down/end
#
# アニメーションイベントハンドラ 大怯み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ダウンもがきに移行
    function animated_java_ranposu:ranposu/animations/down/tween {duration:1, to_frame: 1}
