#> mhdp_monster_dino:core/damage/reaction/body
#
# 怯みリアクション 胴
#
# @within function mhdp_monster_dino:core/damage/damage

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値リセット
        scoreboard players operation @s Mns.Dino.Body.Damage = @s Mns.Dino.Body.Damage.Max

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0
    
# 状態取得
    execute facing entity @n[tag=Temp.Attacker] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# アニメーション再生
    execute if entity @s[tag=!Mns.State.IsFlying,tag=Mns.Temp.Right] run function animated_java_dino:dino/animations/damage_left/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.Right] run function animated_java_dino:dino/animations/damage_right/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monsters:core/util/damage/reaction_flying

# 独自処理
    # ダウン時間設定
        scoreboard players set @s Mns.General.DownCount 2
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 終了
    tag @s add Mns.Temp.IsDamaged
    tag @s remove Mns.Temp.Right