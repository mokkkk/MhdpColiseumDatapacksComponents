#> mhdp_monster_dino:core/damage/reaction/leg_r
#
# 怯みリアクション 胴
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値リセット
        scoreboard players operation @s Mns.Dino.LegR.Damage = @s Mns.Dino.LegR.Damage.Max
    # 怯み回数増加
        scoreboard players add @s Mns.Dino.LegR.Damage.Count 1

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# アニメーション再生
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] unless score @s Mns.Dino.LegR.Damage.Count matches 2.. run function animated_java_dino:dino/animations/damage_left/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=!Mns.State.IsFlying] if score @s Mns.Dino.LegR.Damage.Count matches 2.. run function animated_java_dino:dino/animations/damage_down_left/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monsters:core/util/damage/reaction_flying

# 独自処理
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 3
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # 怯み回数リセット
        execute if score @s Mns.Dino.LegR.Damage.Count matches 2.. run scoreboard players set @s Mns.Dino.LegR.Damage.Count 0

# 終了
    tag @s add Mns.Temp.IsDamaged
