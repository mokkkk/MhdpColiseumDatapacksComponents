#> mhdp_monster_reus:core/damage/reaction/anger
#
# 怯みリアクション 怒り
#
# @within function mhdp_monster_reus:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Anger.Damage = @s Mns.Anger.Damage.Max
        scoreboard players operation @s Mns.Anger.Timer = @s Mns.Anger.Timer.Max
    # 状態更新
        tag @s add Mns.State.IsAnger
    # ボスバー更新
        bossbar set mhdp_monster:reus name [{"text":"火竜"},{"text":"\uE001","font":"minecraft:ui/monster_hp"}]

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
        execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java:reus_aj/animations/land_anger/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java:reus_aj/animations/fly_anger/tween {duration:1, to_frame: 0}
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag

# 終了
    tag @s add Mns.Temp.IsDamaged
