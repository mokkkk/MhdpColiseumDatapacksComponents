#> mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_vertical.m
#
# tick処理 戦闘中 建築物攻撃 攻撃キャンセル 翼槍叩きつけ
#
# @within function mhdp_monster_valk:core/tick/on_battle/interact/on_attack_object
# @input arg Side 左右 ("r" / "l")

# 攻撃キャンセルタグ付与 (同tick内のプレイヤー・モンスターへのダメージを無効化)
    tag @s add Mns.Temp.HitObject

# モデル変更 (一部モデル変更のリセット)
    function mhdp_monster_valk:core/util/models/model_interrupt

# アニメーション再生処理
    # アニメーション再生
        # 怒り時
            $execute if entity @s[tag=Mns.State.IsAnger] run function animated_java_valk:valk/animations/lance_interrupt_vertical_$(Side)_anger/tween {duration:1, to_frame: 1}
        # 非怒り時
            $execute if entity @s[tag=!Mns.State.IsAnger] run function animated_java_valk:valk/animations/lance_interrupt_vertical_$(Side)/tween {duration:1, to_frame: 1}
    # 演出
        playsound minecraft:block.creaking_heart.hit master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        playsound minecraft:entity.puffer_fish.death master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
        playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 対象オブジェクトに合わせて位置調整
    execute at @s facing entity @n[tag=Asset.Build.Temp.AttackTarget] feet positioned as @n[tag=Asset.Build.Temp.AttackTarget] run tp @s ^ ^ ^-6 ~ 0

# 建築物の消滅tick上書き
    execute if entity @s[tag=!Mns.State.IsAnger] run data modify storage api: Return.OverrideRemoveTick set value 62

# 攻撃終了 (部位の相殺受付状態も含めて後始末)
    function mhdp_monsters:core/util/tick/event/end_attack
