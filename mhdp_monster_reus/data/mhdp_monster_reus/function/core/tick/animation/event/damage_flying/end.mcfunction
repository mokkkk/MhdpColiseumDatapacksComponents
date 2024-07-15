#> mhdp_monster_ranposu:core/tick/animation/event/damage_flying/end
#
# アニメーションイベントハンドラ バックステップ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ダウンもがきに移行
    function animated_java:ranposu_aj/animations/down/tween {duration:1, to_frame: 1}
