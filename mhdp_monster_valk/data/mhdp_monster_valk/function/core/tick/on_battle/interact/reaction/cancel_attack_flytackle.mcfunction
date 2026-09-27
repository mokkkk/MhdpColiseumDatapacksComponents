#> mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_flytackle
#
# tick処理 戦闘中 建築物攻撃 攻撃キャンセル 滑空突進
#
# @within function mhdp_monster_valk:core/tick/on_battle/interact/on_attack_object

# 攻撃キャンセルタグ付与 (同tick内のプレイヤー・モンスターへのダメージを無効化)
    tag @s add Mns.Temp.HitObject

# モデル変更 (一部モデル変更のリセット)
    function mhdp_monster_valk:core/util/models/model_interrupt

# 滑空突進の状態リセット
    # 同tick内の2回目の移動処理 (lance_flytackle/main_sub) を止める
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_flytackle.playing] run tag @s add Mns.Temp.Valk.EndFlyTackle
    # 移動先・連続回数
        kill @e[type=area_effect_cloud,tag=Mns.MovePos.Valk]
        scoreboard players set @s Mns.Valk.JetCount 0

# アニメーション再生処理
    # アニメーション再生
        function animated_java_valk:valk/animations/lance_interrupt_flytackle/tween {duration:1, to_frame: 1}
    # 演出
        playsound minecraft:block.creaking_heart.hit master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        playsound minecraft:entity.puffer_fish.death master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
        playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
        playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 建築物の消滅tick上書き
    #TODO: 怯みアニメの長さに合わせて調整
    data modify storage api: Return.OverrideRemoveTick set value 10

# 攻撃終了 (部位の相殺受付状態も含めて後始末)
    function mhdp_monsters:core/util/tick/event/end_attack
