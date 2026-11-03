#> mhdp_monster_reus:core/damage/reaction/ambush
#
# 怯みリアクション 不意打ち (非戦闘中に初撃を受けたとき)
#
# @within function mhdp_monster_reus:core/tick/on_battle/start_ambush

# 共通処理
    # 怯み開始時
        function mhdp_monsters:core/util/damage/on_reaction_start

# 麻痺・ダウン・スタン時はアニメーションを再生しない
    execute unless entity @s[tag=!Mns.State.IsParalysis,tag=!Mns.State.IsDown,tag=!Mns.State.IsStun] run return 0

# 状態取得
    execute facing entity @n[tag=Temp.Attacker] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right
    function mhdp_monsters:core/util/tick/animation/check_player_situation.m {Tag:"Temp.Attacker"}

# アニメーション再生
    # 正面・背面は頭の怯み、側面は左右の怯み
    # TODO(AJ未出力: damage_head) execute if entity @s[tag=!Mns.State.IsFlying] unless entity @n[tag=Temp.Attacker,tag=!Mns.Temp.Situation.IsForward,tag=!Mns.Temp.Situation.IsBack] run function animated_java_reus:reus/animations/damage_head/tween {duration:1, to_frame: 0}
    # TODO(AJ未出力: damage_left) execute if entity @s[tag=!Mns.State.IsFlying,tag=Mns.Temp.Right] if entity @n[tag=Temp.Attacker,tag=!Mns.Temp.Situation.IsForward,tag=!Mns.Temp.Situation.IsBack] run function animated_java_reus:reus/animations/damage_left/tween {duration:1, to_frame: 0}
    # TODO(AJ未出力: damage_right) execute if entity @s[tag=!Mns.State.IsFlying,tag=!Mns.Temp.Right] if entity @n[tag=Temp.Attacker,tag=!Mns.Temp.Situation.IsForward,tag=!Mns.Temp.Situation.IsBack] run function animated_java_reus:reus/animations/damage_right/tween {duration:1, to_frame: 0}
    execute if entity @s[tag=Mns.State.IsFlying,tag=!Mns.Temp.IsDamaged] run function mhdp_monsters:core/util/damage/reaction_flying

# 独自処理
    # 演出
        playsound entity.item.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5

# 終了
    tag @s add Mns.Temp.IsDamaged
    tag @s remove Mns.Temp.Right
    tag @a[distance=..100] remove Mns.Temp.Situation.IsForward
    tag @a[distance=..100] remove Mns.Temp.Situation.IsBack
