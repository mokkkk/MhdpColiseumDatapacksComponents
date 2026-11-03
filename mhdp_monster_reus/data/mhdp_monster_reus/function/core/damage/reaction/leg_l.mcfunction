#> mhdp_monster_reus:core/damage/reaction/leg_l
#
# 怯みリアクション 左脚
#
# @within function mhdp_monster_reus:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値リセット
        scoreboard players operation @s Mns.Reus.LegL.Damage = @s Mns.Reus.LegL.Damage.Max
    # 怯み回数増加
        scoreboard players add @s Mns.Reus.LegL.Damage.Count 1

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# アニメーション再生
    # TODO(AJ未出力: damage_leg_l) execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java_reus:reus/animations/damage_leg_l/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monsters:core/util/damage/reaction_flying

# 独自処理
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 2
    # 攻撃者を向く
        execute at @s facing entity @a[tag=Temp.Attacker] feet run tp @s ~ ~ ~ ~ 0
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag

# 終了
    tag @s add Mns.Temp.IsDamaged
