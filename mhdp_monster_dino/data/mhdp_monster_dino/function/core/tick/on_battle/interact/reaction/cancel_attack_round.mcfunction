#> mhdp_monster_dino:core/tick/on_battle/interact/reaction/cancel_attack_round
#
# tick処理 戦闘中 建築物攻撃 攻撃キャンセル
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 攻撃キャンセルタグ付与
    tag @s add Mns.Temp.HitObject

# 対象オブジェクトを向く
    execute facing entity @n[tag=Asset.Build.Temp.AttackTarget] feet run rotate @s ~ 0

# アニメーション再生処理
    # アニメーション再生
        function animated_java_dino:dino/animations/roundforce_interrupt/tween {duration:1, to_frame: 1}
    # 演出
        playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
        playsound entity.ravager.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound item.mace.smash_air master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound item.mace.smash_air master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 上書き
    data modify storage api: Return.OverrideRemoveTick set value 39

# 攻撃終了
    function mhdp_monster_dino:core/tick/on_battle/attack/end
