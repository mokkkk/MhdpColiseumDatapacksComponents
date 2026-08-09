#> mhdp_monster_ranposu:core/tick/on_battle/interact/reaction/cancel_attack_tackle
#
# tick処理 戦闘中 建築物攻撃 攻撃キャンセル
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 攻撃キャンセルタグ付与
    tag @s add Mns.Temp.HitObject

# アニメーション再生処理
    # アニメーション再生
        function animated_java_ranposu:ranposu/animations/interrupt_object_tackle/tween {duration:1, to_frame: 1}

    # 演出
        playsound minecraft:block.creaking_heart.hit master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        playsound minecraft:entity.puffer_fish.death master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.9
        playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.6
