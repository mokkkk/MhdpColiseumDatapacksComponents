#> mhdp_monster_dino:core/tick/on_battle/interact/reaction/avoid_object
#
# tick処理 戦闘中 建築物サーチ 建築物回避
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 通常時
    # サイドステップ
        # return run function animated_java_dino:dino/animations/step_side_r/tween {duration:1, to_frame: 1}
    
# 喉赤熱化時
    # 移動ブレス
        return run function animated_java_dino:dino/animations/breath_move_r/tween {duration:1, to_frame: 1}
