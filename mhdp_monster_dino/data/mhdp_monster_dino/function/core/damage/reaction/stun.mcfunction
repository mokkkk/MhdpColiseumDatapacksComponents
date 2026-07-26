#> mhdp_monster_dino:core/damage/reaction/stun
#
# 怯みリアクション スタン
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値上昇
        scoreboard players operation @s Mns.Stun.Damage.Max *= #const_stun_damage_multiply Const
        execute store result score @s Mns.Stun.Damage run scoreboard players operation @s Mns.Stun.Damage.Max /= #const_100 Const
    # 状態設定
        tag @s add Mns.State.IsStun
        scoreboard players set @s Mns.General.DownCount 7
    
# 状態取得
    execute facing entity @n[tag=Temp.Attacker] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# アニメーション再生
    execute if entity @s[tag=!Mns.State.IsFlying,tag=Mns.Temp.Right] run function animated_java_dino:dino/animations/damage_down_left/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.Right] run function animated_java_dino:dino/animations/damage_down_right/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying] run function mhdp_monsters:core/util/damage/reaction_flying

# 演出
    playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 終了
    tag @s add Mns.Temp.IsDamaged
    tag @s remove Mns.Temp.Right
