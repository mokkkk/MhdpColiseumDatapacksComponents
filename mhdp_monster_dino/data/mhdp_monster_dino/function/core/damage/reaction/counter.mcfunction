#> mhdp_monster_dino:core/damage/reaction/counter
#
# 怯みリアクション 相殺怯み
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値上昇
        scoreboard players operation @s Mns.Counter.Damage.Max *= #const_counter_damage_multiply Const
        execute store result score @s Mns.Counter.Damage run scoreboard players operation @s Mns.Counter.Damage.Max /= #const_100 Const

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
 
# アニメーション再生
    execute if entity @s[tag=Mns.Temp.Attack.Tail.R] run function animated_java_dino:dino/animations/damage_counter_tail_right_start/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.Temp.Attack.Tail.L] run function animated_java_dino:dino/animations/damage_counter_tail_left_start/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=!Mns.Temp.Attack.Tail.R,tag=!Mns.Temp.Attack.Tail.L] run function animated_java_dino:dino/animations/damage_counter_head_start/tween {duration:1, to_frame: 0}

# 飛行状態リセット
    tag @s remove Mns.State.IsFlying

# 攻撃者が近い場合、見えやすいよう正面に移動
    execute if entity @a[tag=Temp.Attacker,distance=..4] at @a[tag=Temp.Attacker] rotated ~ 0 run tp @s ^ ^ ^3 ~180 0

# 演出
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 終了
    tag @s add Mns.Temp.IsDamaged
