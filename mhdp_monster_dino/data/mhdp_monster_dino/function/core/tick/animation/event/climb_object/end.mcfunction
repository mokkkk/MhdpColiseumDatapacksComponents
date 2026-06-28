#> mhdp_monster_ranposu:core/tick/animation/event/jump/end
#
# アニメーションイベントハンドラ 急襲
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 急襲に遷移
    function animated_java_ranposu:ranposu/animations/jump/tween {duration:1, to_frame: 1}
