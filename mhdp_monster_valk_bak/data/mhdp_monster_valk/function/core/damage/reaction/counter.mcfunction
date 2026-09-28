#> mhdp_monster_valk:core/damage/reaction/counter
#
# 怯みリアクション 相殺
#
# @within function mhdp_monster_reus:core/damage/damage

# 共通処理
    # 耐性値上昇
        scoreboard players operation @s Mns.Counter.Damage.Max *= #const_counter_damage_multiply Const
        execute store result score @s Mns.Counter.Damage run scoreboard players operation @s Mns.Counter.Damage.Max /= #const_100 Const

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # ある程度近くにいる場合、攻撃者から見て正面に移動
        execute if entity @a[tag=Temp.Attacker,distance=..8] at @a[tag=Temp.Attacker] rotated ~ 0 run tp @s ^ ^ ^8 ~180 0
    # アニメーション再生
        # 再生アニメーション決定
            execute if entity @s[tag=Mns.Valk.State.Attack.Wing.R] run function animated_java:valk_aj/animations/lance_damage_counter_wing_r_start/tween {duration:1, to_frame: 0}
            execute if entity @s[tag=Mns.Valk.State.Attack.Wing.L] run function animated_java:valk_aj/animations/lance_damage_counter_wing_l_start/tween {duration:1, to_frame: 0}
            execute if entity @s[tag=!Mns.Valk.State.Attack.Wing.R,tag=!Mns.Valk.State.Attack.Wing.L] run function animated_java:valk_aj/animations/lance_damage_counter_head_start/tween {duration:1, to_frame: 0}
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag

# 終了
    tag @s remove Mns.State.IsFlying
    function mhdp_monster_valk:core/damage/reaction/general
