#> mhdp_monster_reus:core/damage/reaction/anger
#
# 怯みリアクション 怒り
#
# @within function mhdp_monster_reus:core/damage/damage
# @within function mhdp_monster_reus:core/debug/interrupt_anger

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値リセット
        scoreboard players operation @s Mns.Anger.Damage = @s Mns.Anger.Damage.Max
    # 状態更新 (Mns.State.IsAnger 付与・タイマー・ボスバー名更新)
        function mhdp_monsters:core/util/tick/start_anger.m {Name:"reus"}
    # モデル変更 (怒り時のモデル差し替えがある場合のみ。util/models/anger_start を作成してから有効化する)
        # function mhdp_monster_reus:core/util/models/anger_start

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# アニメーション再生
    # TODO(AJ未出力: land_anger) execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java_reus:reus/animations/land_anger/tween {duration:1, to_frame: 0}

# 終了
    tag @s add Mns.Temp.IsDamaged
