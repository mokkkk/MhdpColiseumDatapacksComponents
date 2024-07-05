#> mhdp_monster_ranposu:core/damage/reaction/stun
#
# 怯みリアクション スタン
#
# @within function mhdp_monster_ranposu:core/damage/damage

# 共通処理
    # 耐性値上昇
        scoreboard players operation @s Mns.Stun.Damage.Max *= #const_stun_damage_multiply Const
        execute store result score @s Mns.Stun.Damage run scoreboard players operation @s Mns.Stun.Damage.Max /= #const_100 Const
    # 状態設定
        tag @s add Mns.State.IsStun

# アニメーション再生処理
    # アニメーション再生
        function animated_java:ranposu_aj/animations/damage_down/tween {duration:1, to_frame: 0}
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 6
    # 攻撃者を向く
        execute at @s facing entity @a[tag=Temp.Attacker] feet run tp @s ~ ~ ~ ~ 0
    # 演出
        playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.9
        playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.6
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
