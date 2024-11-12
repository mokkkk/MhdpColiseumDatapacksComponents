#> mhdp_monster_dino:core/damage/reaction/body
#
# 怯みリアクション 胴
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Dino.Body.Damage = @s Mns.Dino.Body.Damage.Max

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
        # ターゲットが左右どちらにいるか確認
            execute facing entity @e[tag=Mns.Target.Dino,limit=1] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right
        # 再生アニメーション決定
            execute if entity @s[tag=Mns.Temp.Right,tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java:dino_aj/animations/damage_left/tween {duration:1, to_frame: 0}
            execute if entity @s[tag=!Mns.Temp.Right,tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function animated_java:dino_aj/animations/damage_right/tween {duration:1, to_frame: 0}
            execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_dino:core/damage/reaction/flying
            tag @s remove Mns.Temp.Right
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 2
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag

# 終了
    function mhdp_monster_dino:core/damage/reaction/general
