#> mhdp_monster_ranposu:core/damage/reaction/counter
#
# 怯みリアクション 相殺怯み
#
# @within function mhdp_monster_ranposu:core/damage/damage

# 共通処理
    # 耐性値上昇
        scoreboard players operation @s Mns.Counter.Damage.Max *= #const_counter_damage_multiply Const
        execute store result score @s Mns.Counter.Damage run scoreboard players operation @s Mns.Counter.Damage.Max /= #const_100 Const

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # ある程度近くにいる場合、攻撃者から見て正面に移動
        execute if entity @a[tag=Temp.Attacker,distance=..4] at @a[tag=Temp.Attacker] rotated ~ 0 run tp @s ^ ^ ^3 ~180 0
    # アニメーション再生
        function animated_java:ranposu_aj/animations/damage_counter_start/tween {duration:1, to_frame: 0}
    # 演出
        playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.9
        playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.6
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # 状態更新
        tag @s remove Mns.State.IsFlying

# 終了
    tag @s add Mns.Temp.IsDamaged
