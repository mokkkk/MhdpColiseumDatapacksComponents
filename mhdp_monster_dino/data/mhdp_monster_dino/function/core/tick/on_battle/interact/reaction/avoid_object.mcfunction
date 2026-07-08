#> mhdp_monster_dino:core/tick/on_battle/interact/reaction/avoid_object
#
# tick処理 戦闘中 建築物サーチ 建築物回避
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# アニメーション再生処理
    # アニメーション再生
        function animated_java_dino:dino/animations/step_side_r/tween {duration:1, to_frame: 1}
