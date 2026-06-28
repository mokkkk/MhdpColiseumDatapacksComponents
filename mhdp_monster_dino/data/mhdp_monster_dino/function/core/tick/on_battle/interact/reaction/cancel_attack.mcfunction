#> mhdp_monster_ranposu:core/tick/on_battle/interact/reaction/cancel_attack
#
# tick処理 戦闘中 建築物攻撃 攻撃キャンセル
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# アニメーション再生処理
    # アニメーション再生
        function animated_java_ranposu:ranposu/animations/interrupt_object/tween {duration:1, to_frame: 1}

    # 演出
        playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.9
        playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.6
