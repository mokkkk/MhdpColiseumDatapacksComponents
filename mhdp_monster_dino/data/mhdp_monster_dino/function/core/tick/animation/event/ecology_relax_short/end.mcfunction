#> mhdp_monster_dino:core/tick/animation/event/idle/end
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_dino:core/tick/animation/event/idle/main

# 一定確率で生態行動(長)に遷移
    execute if predicate {"condition":"minecraft:random_chance","chance":0.3} run return run function animated_java_dino:dino/animations/ecology_relax_long/tween {duration:1, to_frame: 1}

# 待機に戻る
    function animated_java_dino:dino/animations/idle_relax/tween {duration:1, to_frame: 0}
