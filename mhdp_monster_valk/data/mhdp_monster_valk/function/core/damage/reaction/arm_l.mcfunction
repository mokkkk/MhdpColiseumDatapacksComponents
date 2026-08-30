#> mhdp_monster_valk:core/damage/reaction/arm_l
#
# 怯みリアクション 左腕
#
# @within function mhdp_monster_valk:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値リセット
        scoreboard players operation @s Mns.Valk.ArmL.Damage = @s Mns.Valk.ArmL.Damage.Max
    # 怯み回数増加
        scoreboard players add @s Mns.Valk.ArmL.Damage.Count 1

# 部位破壊処理
    execute if entity @s[tag=!Mns.Break.Arm.L] run function mhdp_monster_valk:core/damage/break/arm_l

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# アニメーション再生 (3回目からダウン)
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] if score @s Mns.Valk.ArmL.Damage.Count matches ..2 run function animated_java_valk:valk/animations/lance_damage_body_l/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] if score @s Mns.Valk.ArmL.Damage.Count matches 3.. run function animated_java_valk:valk/animations/lance_damage_down_l/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_valk:core/damage/reaction/flying

# 独自処理
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 2
        execute if score @s Mns.Valk.ArmL.Damage.Count matches 3.. run scoreboard players set @s Mns.General.DownCount 5
    # 状態設定
        execute if score @s Mns.Valk.ArmL.Damage.Count matches 3.. run tag @s add Mns.State.IsDown
        tag @s remove Mns.State.IsDisableAngerSpeed
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag

# 終了
    execute if score @s Mns.Valk.ArmL.Damage.Count matches 3.. run scoreboard players set @s Mns.Valk.ArmL.Damage.Count 0
    function mhdp_monster_valk:core/damage/reaction/general
