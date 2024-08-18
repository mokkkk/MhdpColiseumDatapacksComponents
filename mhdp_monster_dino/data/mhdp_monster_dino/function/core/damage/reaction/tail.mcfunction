#> mhdp_monster_dino:core/damage/reaction/tail
#
# 怯みリアクション 尻尾
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # スコアリセット
        scoreboard players operation @s Mns.Dino.Tail.Damage = @s Mns.Dino.Tail.Damage.Max
    # カウンター増加
        scoreboard players add @s Mns.Dino.Tail.Damage.Count 1

# 部位破壊処理
    execute if entity @s[tag=!Mns.Break.Tail] if score @s Mns.Dino.Tail.Damage.Count matches 2.. run function mhdp_monster_dino:core/damage/reaction/tail_break

# 切断属性のみ、部位破壊・切断処理
    execute if entity @s[tag=Mns.Dino.State.TailHeat,tag=Mns.Break.Tail,tag=!Mns.Break.Tail.Cut] if score #mhdp_temp_damage_phys_type MhdpCore matches 0 run function mhdp_monster_dino:core/damage/reaction/tail_break_cut

# アニメーション再生処理
    # 麻痺・ダウン・スタン時以外
        execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    # アニメーション再生
        execute facing entity @n[tag=Temp.Attacker] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.3] at @s run tag @s add Mns.Temp.Forward
        execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged,tag=Mns.Dino.Temp.Tail.Break] run function animated_java:dino_aj/animations/damage_tail_break/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged,tag=Mns.Temp.Forward,tag=!Mns.Dino.Temp.Tail.Break] run function animated_java:dino_aj/animations/damage_tail_forward/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged,tag=!Mns.Temp.Forward,tag=!Mns.Dino.Temp.Tail.Break] run function animated_java:dino_aj/animations/damage_tail_back/tween {duration:1, to_frame: 0}
        execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monster_dino:core/damage/reaction/flying
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 0
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    # アニメーションタグ消去
        function mhdp_monsters:core/util/other/remove_animation_tag

# 終了
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Dino.Temp.Tail.Break
