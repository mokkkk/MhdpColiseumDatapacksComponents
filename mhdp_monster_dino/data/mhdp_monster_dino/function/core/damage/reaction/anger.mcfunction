#> mhdp_monster_dino:core/damage/reaction/anger
#
# 怯みリアクション 怒り
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Anger.Damage = @s Mns.Anger.Damage.Max
        scoreboard players operation @s Mns.Anger.Timer = @s Mns.Anger.Timer.Max
    # 状態更新
        tag @s add Mns.State.IsAnger
    # ボスバー更新
        bossbar set mhdp_monster:dino name [{"text":"斬竜"},{"text":"\uE001","font":"minecraft:ui/monster_hp"}]

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
        execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java:dino_aj/animations/anger/tween {duration:1, to_frame: 0}
    # モデル変更
        function mhdp_monster_dino:core/util/models/anger_start
