#> mhdp_monster_ranposu:core/damage/reaction/anger
#
# 怯みリアクション 怒り
#
# @within function mhdp_monster_ranposu:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値リセット
        scoreboard players operation @s Mns.Anger.Damage = @s Mns.Anger.Damage.Max
    # 状態更新
        function mhdp_monsters:core/util/tick/start_anger.m {Name:"ranposu"}

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# アニメーション再生
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java_ranposu:ranposu/animations/anger/tween {duration:1, to_frame: 0}

# 終了
    tag @s add Mns.Temp.IsDamaged
