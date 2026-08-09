#> mhdp_monster_dino:core/tick/on_battle/interact/reaction/cancel_attack_tail
#
# tick処理 戦闘中 建築物攻撃 攻撃キャンセル
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 攻撃キャンセルタグ付与
    tag @s add Mns.Temp.HitObject

# アニメーション再生処理
    # アニメーション再生
        execute if entity @s[tag=Mns.Temp.Attack.Tail.R] run function animated_java_dino:dino/animations/tail_interrupt_r/tween {duration:1, to_frame: 1}
        execute unless entity @s[tag=Mns.Temp.Attack.Tail.R] run function animated_java_dino:dino/animations/tail_interrupt_l/tween {duration:1, to_frame: 1}
    # 演出
        playsound minecraft:block.creaking_heart.hit master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        playsound minecraft:entity.puffer_fish.death master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
        playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 上書き
    data modify storage api: Return.OverrideRemoveTick set value 10

# 攻撃終了
    function mhdp_monster_dino:core/tick/on_battle/attack/end
