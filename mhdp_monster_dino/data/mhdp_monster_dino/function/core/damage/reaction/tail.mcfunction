#> mhdp_monster_dino:core/damage/reaction/head
#
# 怯みリアクション 頭
#
# @within function mhdp_monster_dino:core/damage/damage

# 部位破壊処理
    execute if entity @s[tag=Mns.Dino.State.TailHeat,tag=Mns.Break.Tail,tag=!Mns.Break.Tail.Cut] run function mhdp_monster_dino:core/damage/break/tail_cut
    execute if entity @s[tag=!Mns.Break.Tail] run function mhdp_monster_dino:core/damage/break/tail
    tag @s remove Mns.State.Tutorial.IsBroken

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start
    # 耐性値リセット
        scoreboard players operation @s Mns.Dino.Tail.Damage = @s Mns.Dino.Tail.Damage.Max

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# 状態取得
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Temp.Attacker"}

# アニメーション再生
    execute if entity @s[tag=Mns.Temp.IsDamage.TailCut] run function animated_java_dino:dino/animations/damage_tail_break/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged,tag=!Mns.Temp.IsDamage.TailCut] if entity @n[tag=Temp.Attacker,tag=Mns.Temp.Situation.IsForward] run function animated_java_dino:dino/animations/damage_tail_forward/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged,tag=!Mns.Temp.IsDamage.TailCut] if entity @n[tag=Temp.Attacker,tag=!Mns.Temp.Situation.IsForward] run function animated_java_dino:dino/animations/damage_tail_back/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged,tag=!Mns.Temp.IsDamage.TailCut] run function mhdp_monsters:core/util/damage/reaction_flying

# 独自処理
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 終了
    tag @s add Mns.Temp.IsDamaged
    tag @s remove Mns.Temp.IsDamage.TailCut
    tag @a[distance=..100] remove Mns.Temp.Situation.IsForward
    tag @a[distance=..100] remove Mns.Temp.Situation.IsBack
