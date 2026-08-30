#> mhdp_monster_valk:core/damage/reaction/counter
#
# 怯みリアクション 相殺怯み
#
# @within function mhdp_monster_valk:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値上昇
        scoreboard players operation @s Mns.Counter.Damage.Max *= #const_counter_damage_multiply Const
        execute store result score @s Mns.Counter.Damage run scoreboard players operation @s Mns.Counter.Damage.Max /= #const_100 Const

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# 攻撃者がある程度近い場合、攻撃者から見て正面に移動
    execute if entity @a[tag=Temp.Attacker,distance=..8] at @a[tag=Temp.Attacker] rotated ~ 0 run tp @s ^ ^ ^8 ~180 0

# アニメーション再生 (発動していた翼爪 / 頭で分岐)
    execute if entity @s[tag=Mns.Valk.State.Attack.Wing.R] run function animated_java_valk:valk/animations/lance_damage_counter_wing_r_start/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.Valk.State.Attack.Wing.L] run function animated_java_valk:valk/animations/lance_damage_counter_wing_l_start/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=!Mns.Valk.State.Attack.Wing.R,tag=!Mns.Valk.State.Attack.Wing.L] run function animated_java_valk:valk/animations/lance_damage_counter_head_start/tween {duration:1, to_frame: 0}

# 演出
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# アニメーションタグ消去
    function mhdp_monsters:core/util/other/remove_animation_tag

# 飛行状態リセット
    tag @s remove Mns.State.IsFlying

# 終了
    function mhdp_monster_valk:core/damage/reaction/general
